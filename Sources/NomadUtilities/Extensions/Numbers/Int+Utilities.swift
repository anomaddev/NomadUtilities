//
//  Int+Utilities.swift
//
//
//  Created by Justin Ackermann on 11/24/23.
//

import Foundation

// MARK: - Int
public extension Int {

    /// prints the `Int` to the console
    func debug()
    { print(self) }
    
    // MARK: - Facts
    var isEven: Bool { self % 2 == 0 }
    var isOdd: Bool { !isEven }
    
    // MARK: - Base Conversions
    var double: Double      { Double(self) }
    var float: Float        { Float(self) }
    var cgfloat: CGFloat    { CGFloat(self) }
    var number: NSNumber    { NSNumber(value: self) }
    
    // MARK: - Date Conversions
    var date: Date
    { return Date(timeIntervalSince1970: TimeInterval(self)) }
    
    var interval: TimeInterval
    { return TimeInterval(self) }
    
    var ordinal: String? {
        let ordinalFormatter: NumberFormatter = {
            let formatter = NumberFormatter()
            formatter.numberStyle = .ordinal
            return formatter
        }()
        return ordinalFormatter.string(from: NSNumber(value: self))
    }
    
    // MARK: - Stringify's
    var string: String
    { "\(self)" }
    
    var stringify: String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        return numberFormatter.string(from: NSNumber(value: self)) ?? "0"
    }
    
    var socialify: String {
        let num = abs(Double(self))
        let sign = (self < 0) ? "-" : ""
        
        switch num {
        case 1_000_000_000...:
            var formatted = num / 1_000_000_000
            formatted = formatted.truncate(places: 1)
            return "\(sign)\(formatted)B"
            
        case 1_000_000...:
            var formatted = num / 1_000_000
            formatted = formatted.truncate(places: 1)
            return "\(sign)\(formatted)M"
            
        case 1_000...:
            var formatted = num / 1_000
            formatted = formatted.truncate(places: 1)
            return "\(sign)\(formatted)K"
            
        case 0...:
            return "\(self)"
            
        default:
            return "\(sign)\(self)"
            
        }
    }
    
    // MARK: - Time
    
    /// hours, minutes, seconds
    func HMS() -> (Int, Int, Int)
    { return (self / 3600, (self % 3600) / 60, (self % 3600) % 60) }

    /// Takes a `Int` of 'Seconds' and returns Days, Hours, Minutes & Seconds
    func asComponents() -> (Int?, Int, Int, Int) {
        let days: Int? = 86400 < self ? (self / 86400) : nil
        let hours: Int = days != nil ? ((self % 86400) / 3600) : self / 3600
        
        return (
            days,
            hours,
            ((self % 3600) / 60),
            ((self % 3600) % 60)
        )
    }
}

// MARK: - Int64
public extension Int64 {
    var int: Int
    { Int(self) }
    
    // MARK: - Stringify's
    var string: String
    { "\(self)" }
}

public extension UInt64 {
    // MARK: - Stringify's
    var string: String
    { "\(self)" }
}

// MARK: - UInt
public extension UInt {
    var int: Int
    { Int(self) }
}
