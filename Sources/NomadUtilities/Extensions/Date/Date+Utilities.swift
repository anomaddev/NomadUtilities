//
//  Date+Utilities.swift
//  
//
//  Created by Justin Ackermann on 9/28/23.
//

import Foundation

extension Date {
    
    /// Returns the current `Date`
    public static var current: Date
    { Date() }
    
    /// prints the `Date` to the console
    ///
    /// - todo: change to seletive format
    func debug()
    { print(self) }
    
    /// Date represented in seconds as a `TimeInterval` aka `Double`
    public var since1970: TimeInterval
    { self.timeIntervalSince1970 }
    
    /// Date represented in seconds rounded to an `Integer`
    public var seconds: Int
    { self.since1970.int }
    
    /// The nTh day of the year
    public var nthDay: Int! {
        return Calendar.current
            .ordinality(of: .day, in: .year, for: self)!
    }
    
    /// The nTh day of the year in the specified timezone
    public func nthDayIn(timezone: TimeZone) -> Int! {
        var calendar = Calendar.current
        calendar.timeZone = timezone
        return calendar.ordinality(of: .day, in: .year, for: self)!
    }
}
