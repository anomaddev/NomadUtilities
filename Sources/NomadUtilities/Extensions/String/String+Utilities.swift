//
//  String+Utilities.swift
//  
//
//  Created by Justin Ackermann on 9/26/23.
//

import Foundation

extension String {
    
    /// prints the `String` to the console
    func debug()
    { print(self) }
}

extension Substring.SubSequence {
    
    /// outputs a `Substring.SubSequence` as a `String`
    public var string: String
    { String(self) }
    
    /// prints the `Substring.SubSequence` to the console
    func debug()
    { print(self) }
}
