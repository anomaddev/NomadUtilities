//
//  Errors.swift
//  
//
//  Created by Justin Ackermann on 9/26/23.
//

import Foundation

extension Error {
    
    /// deep dive into what the error is all about
    public func explain() {
        print("=========INTERNAL EXPLAIN=========")
        print(localizedDescription)
        print()
        do { throw self }
        catch let decoding as DecodingError { decoding.read() }
        catch {
            print(localizedDescription)
            print((self as NSError).code)
        }
        print()
        print("==================================")
        print()
    }
}
    
extension DecodingError {
    /// print out the type of decoding error
    public func read() {
        print("DECODING ERROR:")
        switch self {
        case .typeMismatch(let key, let value):
            print("error \(key), value \(value) and Err: \(self.localizedDescription)")
        case .valueNotFound(let key, let value):
            print("error \(key), value \(value) and Err: \(self.localizedDescription)")
        case .keyNotFound(let key, let value):
            print("error \(key), value \(value) and Err: \(self.localizedDescription)")
        case .dataCorrupted(let key):
            print("error \(key), and Err: \(self.localizedDescription)")
        default:
            print("Err: \(self.localizedDescription)")
        }
    }
}
