//
//  CGRect+Utilities.swift
//
//
//  Created by Justin Ackermann on 6/26/24.
//

import UIKit

extension CGRect {
    
    /// Creates a `CGRect` with a given width and height
    public static func rect(_ w: CGFloat, _ h: CGFloat) -> CGRect
    { CGRect(origin: .zero, size: .rect(w, h)) }
    
}
