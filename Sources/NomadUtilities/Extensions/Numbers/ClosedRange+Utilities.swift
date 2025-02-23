//
//  ClosedRange+Utilities.swift
//  NomadUtilities
//
//  Created by Justin Ackermann on 2/21/25.
//

extension ClosedRange where Bound == Int {
    /// Returns an array of `count` equally spaced values from the range.
    func equalSpacing(count: Int, include: (start: Bool, end: Bool)! = (true, true)) -> [Int] {
        guard count > 1 else { return [lowerBound] } // If only one, return start
        
        let step = Double(upperBound - lowerBound) / Double(count - 1) // Compute step
        var output = (0..<count).map { lowerBound + Int(round(Double($0) * step)) } // Generate values
        
        if !include.start { output.removeFirst() }
        if !include.end { output.removeLast() }
        
        return output
    }
}
