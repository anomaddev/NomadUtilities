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
    var int64: Int64        { Int64(self) }
    
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
    
    // MARK: - Time Conversions
    
    /// Converts a `Double` time interval into a formatted clock string.
    ///
    /// This property interprets the `Double` value as a time interval in seconds
    /// and returns a clock-style string formatted as `M:SS.HH` or `SS.HH`, depending
    /// on the duration. It includes:
    /// - Minutes (if greater than 0)
    /// - Seconds (zero-padded to 2 digits)
    /// - Hundredths of a second (zero-padded to 2 digits)
    ///
    /// Examples:
    /// - `125.37.clock` → `"2:05.37"`
    /// - `5.8.clock` → `"05.80"`
    ///
    /// This is useful for stopwatch displays, animations, or any feature requiring
    /// precise, user-readable time formatting.
    public var clock: String {
        let hundredths = Int((self * 100).rounded())
        let (minutes, hundredthsOfSeconds) = hundredths.quotientAndRemainder(dividingBy: 60 * 100)
        let (seconds, milliseconds) = hundredthsOfSeconds.quotientAndRemainder(dividingBy: 100)
        let mins = minutes > 0 ? "\(minutes):" : ""
        return "\(mins)\(String(format: "%02d", seconds)).\(String(format: "%02d", milliseconds))"
    }
    
    /// Converts a time interval in seconds into hours, minutes, and seconds.
    ///
    /// This method breaks down the `Double` value (assumed to represent a duration in seconds)
    /// into a tuple of hours, minutes, and seconds as fractional `Double` values.
    /// For example, `3661.5.HMS()` will return `(1.0, 1.0, 1.5)`.
    ///
    /// - Returns: A tuple containing:
    ///   - `hours`: The whole hours component as a `Double`.
    ///   - `minutes`: The whole minutes component as a `Double`.
    ///   - `seconds`: The remaining seconds component as a `Double`.
    func HMS() -> (Double, Double, Double) {
        let (hr,  minf) = modf(self / 3600)
        let (min, secf) = modf(60 * minf)
        return (hr, min, 60 * secf)
    }
}
