//
//  NomadUtilities+UIStackView.swift
//
//
//  Created by Justin Ackermann on 7/14/24.
//

import UIKit

extension UIStackView {
    
    /// Removes all arranged subviews from the stack
    public func removeArrangedSubviews()
    { arrangedSubviews.forEach { $0.removeFromSuperview() }}
    
}
