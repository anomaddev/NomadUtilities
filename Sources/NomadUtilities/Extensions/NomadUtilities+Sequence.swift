//
//  NomadUtilities+Sequence.swift
//
//
//  Created by Justin Ackermann on 6/10/24.
//

import Foundation

extension Sequence {
    
    /// Asynchronously maps the elements of the sequence to a new array
    public func asyncMap<T>(
        _ transform: (Element) async throws -> T
    ) async rethrows -> [T] {
        var values = [T]()

        for element in self {
            try await values.append(transform(element))
        }

        return values
    }
    
    public func concurrentForEach(
        _ operation: @escaping (Element) async -> Void
    ) async {
        // A task group automatically waits for all of its
        // sub-tasks to complete, while also performing those
        // tasks in parallel:
        await withTaskGroup(of: Void.self) { group in
            for element in self {
                group.addTask {
                    await operation(element)
                }
            }
        }
    }
}

extension Array {
    public func safeIndex(_ index: Int) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
