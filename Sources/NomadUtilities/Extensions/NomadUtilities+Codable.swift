//
//  NomadUtilities+Codable.swift
//  NomadUtilities
//
//  Created by Justin Ackermann on 4/23/25.
//

import Foundation

extension Encodable {
    
    /// Converts any Encodable object to JSON Data
    public func jsonData(prettyPrinted: Bool = false) -> Data? {
        let encoder = JSONEncoder()
        if prettyPrinted { encoder.outputFormatting = .prettyPrinted }
        return try? encoder.encode(self)
    }

    /// Converts any Encodable object to a JSON String
    public func jsonString(prettyPrinted: Bool = false) -> String? {
        guard let data = jsonData(prettyPrinted: prettyPrinted) else { return nil }
        return String(data: data, encoding: .utf8)
    }

    /// Compares two Encodable objects by JSON structure
    public func isEqual<T: Encodable>(to other: T) -> Bool
    { return self.jsonData() == other.jsonData() }
}
