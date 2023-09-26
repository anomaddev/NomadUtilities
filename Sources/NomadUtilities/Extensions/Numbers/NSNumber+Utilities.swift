//
//  NSNumber+Utilities.swift
//  
//
//  Created by Justin Ackermann on 9/26/23.
//

import Foundation

extension NSNumber {
    
    /// outputs the `NSNumber` as a `Double`
    public var double: Double
    { Double(truncating: self) }
    
    /// outputs the `NSNumber` as an `Int`
    public var int: Int
    { Int(truncating: self) }
}
