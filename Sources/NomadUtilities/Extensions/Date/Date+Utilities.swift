//
//  Date+Utilities.swift
//  
//
//  Created by Justin Ackermann on 9/28/23.
//

import Foundation

extension Date {
    
    /// Date represented in seconds as a `TimeInterval` aka `Double`
    public var since1970: TimeInterval
    { self.timeIntervalSince1970 }
    
    /// Date represented in seconds rounded to an `Integer`
    public var seconds: Int
    { self.since1970.int }
}
