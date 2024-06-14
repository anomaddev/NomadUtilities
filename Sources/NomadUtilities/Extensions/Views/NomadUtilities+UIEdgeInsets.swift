//
//  NomadUtilities+UIEdgeInsets.swift
//
//
//  Created by Justin Ackermann on 6/13/24.
//

import UIKit

extension UIEdgeInsets {
    
    /// Create a new `UIEdgeInsets` with the same value on all sides
    ///
    /// - parameter vertical: A `CGFloat` value to represent the top and bottom insets
    /// - parameter horizontal: A `CGFloat` value to represent the left and right insets
    /// - returns: A `UIEdgeInsets` value with the values given for horizontal and vertical
    ///
    public static func surrounding(vertical: CGFloat, horizontal: CGFloat) -> UIEdgeInsets
    { return UIEdgeInsets(top: vertical, left: horizontal, bottom: vertical, right: horizontal) }
    
}

