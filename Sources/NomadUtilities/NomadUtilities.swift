//
//  NomadUtilities.swift
//
//
//  Created by Justin Ackermann on 9/27/23.
//

import Foundation

/// A utility class that provides shared utilities for Nomad Style Development
public class NomadUtilities {
    
    /// Shared instance of `NomadUtilities`
    public static let shared = NomadUtilities()
    
    
    public static func delay(_ int: TimeInterval, after: @escaping () -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + int, execute: after)
    }
    
    /// The current environment of the app, defaults to `.development`
    ///
    ///  - Attention: You will have to set this value manually in your AppDelegate or it will default to `.development`
    ///
    public var environment: AppEnvironment = .development
    
    private init() {}
    
    public enum AppEnvironment {
        
        /// Development environment
        case development
        
        /// Staging environment
        case staging
        
        /// Production environment
        case production
    }
}
