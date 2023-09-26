//
//  Double+Utilities.swift
//  
//
//  Created by Justin Ackermann on 9/26/23.
//

import Foundation

extension Double {
    
    /// outputs a `Double` as a `NSNumber`
    public var number: NSNumber
    { NSNumber(floatLiteral: self) }
    
    /// outputs a `Double` as a `Int`
    public var int: Int
    { Int(self) }
    
    /// Rounds the `Double` to a given decimal places
    public func roundTo(places: Int,
                 mode: FloatingPointRoundingRule! = .toNearestOrAwayFromZero) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded(mode) / divisor
    }
    
    /// Truncates a `Double` to a given decimal places
    public func truncate(places: Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded(.towardZero) / divisor
    }
    
}
