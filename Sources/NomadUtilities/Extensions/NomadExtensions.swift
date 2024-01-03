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

extension Encodable {
    /// Convenience function for object which adheres to Codable to compile the JSON
    func compile () -> [String: Any] {
        guard let data = try? JSONEncoder().encode(self) else {
            print("Couldn't encode the given object")
            preconditionFailure("Couldn't encode the given object")
        }
        return (try? JSONSerialization
            .jsonObject(with: data, options: .allowFragments))
        .flatMap { $0 as? [String: Any] }!
    }
}
