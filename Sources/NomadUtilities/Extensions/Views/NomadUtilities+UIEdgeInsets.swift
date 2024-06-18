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
    /// - parameter value: A `CGFloat` value to represent the insets on all sides
    /// - returns: A `UIEdgeInsets` with the given padding value
    ///
    public static func surrounding(_ value: CGFloat) -> UIEdgeInsets
    { return UIEdgeInsets(top: value, left: value, bottom: value, right: value) }
    
    /// Create a new `UIEdgeInsets` with set values for horizontal and vertical
    ///
    /// - parameter vertical: A `CGFloat` value to represent the top and bottom insets
    /// - parameter horizontal: A `CGFloat` value to represent the left and right insets
    /// - returns: A `UIEdgeInsets` with the values given for horizontal and vertical
    ///
    public static func surrounding(vertical: CGFloat, horizontal: CGFloat) -> UIEdgeInsets
    { return UIEdgeInsets(top: vertical, left: horizontal, bottom: vertical, right: horizontal) }
    
}

