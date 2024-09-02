//
//  File.swift
//  
//
//  Created by Justin Ackermann on 8/9/24.
//

import Foundation

public extension Float {
    /// Base Conversions
    var int: Int            { Int(self) }
    var int64: Int64        { Int64(self) }
    
    var cg: CGFloat         { CGFloat(self) }
    var number: NSNumber    { NSNumber(value: self) }
}
