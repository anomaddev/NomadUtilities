//
//  String+Utilities.swift
//  
//
//  Created by Justin Ackermann on 9/26/23.
//

import Foundation

extension String {
    
    /// prints the `String` to the console
    public func debug()
    { print(self) }
    
    /// string to attributed with attributes
    public func attributed(attributes: [NSAttributedString.Key: Any]) -> NSAttributedString
    { NSAttributedString(string: self, attributes: attributes) }
    
    /// string to attributed with defaults
    public var attributed: NSAttributedString
    { NSAttributedString(string: self) }
    
    /// string to mutable attributed with defaults
    public var mutableAttributed: NSMutableAttributedString
    { NSMutableAttributedString(string: self) }
}

extension Substring.SubSequence {
    
    /// outputs a `Substring.SubSequence` as a `String`
    public var string: String
    { String(self) }
    
    /// prints the `Substring.SubSequence` to the console
    public func debug()
    { print(self) }
}

