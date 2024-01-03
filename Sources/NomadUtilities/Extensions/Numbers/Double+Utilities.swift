//
//  Double+Utilities.swift
//  
//
//  Created by Justin Ackermann on 9/26/23.
//

import Foundation

public extension Double {
    
    /// prints the `Double` to the console
    func debug()
    { print(self) }
    
    /// is an Int?
    var isInteger: Bool     { floor(self) == self }
    
    /// Base Conversions
    var int: Int            { Int(self) }
    var float: Float        { Float(self) }
    var cgfloat: CGFloat    { CGFloat(self) }
    var number: NSNumber    { NSNumber(value: self) }
    
    
    // MARK: Unit Conversions
    
    /// Degrees to Radians
    var radians: Double      { self * .pi / 180 }
    /// Radians to Degrees
    var degress: Double      { self * 180 / .pi }
    
    /// String representation
    var string: String
    { "\(self)" }
    
    // MARK: Transforms
    /// Rounds the `Double` to a given decimal places
    func roundTo(places: Int,
                 mode: FloatingPointRoundingRule! = .toNearestOrAwayFromZero) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded(mode) / divisor
    }
    
    /// Truncates a `Double` to a given decimal places
    func truncate(places: Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded(.towardZero) / divisor
    }
    
    func HMS() -> (Double, Double, Double) {
        let (hr,  minf) = modf(self / 3600)
        let (min, secf) = modf(60 * minf)
        return (hr, min, 60 * secf)
    }
}
