//
//  NSNumber+Utilities.swift
//  
//
//  Created by Justin Ackermann on 9/26/23.
//

import Foundation

public extension NSNumber {
    
    /// prints the `NSNumber` to the console
    func debug()
    { print(self) }
    
    /// outputs the `NSNumber` as a `Double`
    var double: Double
    { Double(truncating: self) }
    
    /// outputs the `NSNumber` as an `Int`
    var int: Int
    { Int(truncating: self) }
}
