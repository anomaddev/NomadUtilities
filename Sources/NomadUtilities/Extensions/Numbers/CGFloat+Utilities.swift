//
//  CGFloat+Utilities.swift
//  NomadUtilities
//
//  Created by Justin Ackermann on 9/29/24.
//

import UIKit

extension CGFloat {
    
    /// A 'CGFloat' representative of the 'Double' value.
    public var double: Double
    { Double(self) }
    
    /// Round to given decimal places
    public func rounded(toPlaces places: Int) -> CGFloat {
        let divisor = pow(10.0, CGFloat(places))
        return (self * divisor).rounded() / divisor
    }
}
