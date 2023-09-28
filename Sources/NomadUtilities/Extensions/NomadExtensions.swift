//
//  NomadExtensions.swift
//  
//
//  Created by Justin Ackermann on 9/27/23.
//

import Foundation

extension Encodable {
    
    /// Format the `Encodable` object in a Pretty JSON format for printing to console
    public var prettyJSON: String {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        guard let data = try? encoder.encode(self),
              let output = String(data: data, encoding: .utf8)
        else { return "Error converting \(self) to JSON string" }
        return output
    }
}
