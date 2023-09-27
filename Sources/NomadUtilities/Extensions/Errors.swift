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
        print("===============================")
        do { throw self }
        catch let error as DecodingError {
            switch error {
            case .typeMismatch(let key, let value):
                print("error \(key), value \(value) and ERROR: \(error.localizedDescription)")
            case .valueNotFound(let key, let value):
                print("error \(key), value \(value) and ERROR: \(error.localizedDescription)")
            case .keyNotFound(let key, let value):
                print("error \(key), value \(value) and ERROR: \(error.localizedDescription)")
            case .dataCorrupted(let key):
                print("error \(key), and ERROR: \(error.localizedDescription)")
            default:
                print("ERROR: \(error.localizedDescription)")
            }
        } catch {
            print(error.localizedDescription)
            print((error as NSError).code)
        }
        print("===============================")
        print("")
    }
}
