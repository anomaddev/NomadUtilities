//
//  NomadUtilities+UIImage.swift
//
//
//  Created by Justin Ackermann on 6/13/24.
//

import UIKit

extension UIImage {
    
    /// Rotates an image by a given number of degrees
    ///
    /// - Parameter degrees: The number of degrees to rotate the image by
    /// - Returns: The rotated image
    ///
    public func rotate(degrees: Float) -> UIImage? {
        let radians = CGFloat(degrees * .pi / 180)
        return self.rotate(radians: Float(radians))
    }
    
    /// Rotates an image by a given number of radians
    ///
    /// - Parameter radians: The number of radians to rotate the image by
    /// - Returns: The rotated image
    ///
    public func rotate(radians: Float) -> UIImage? {
        var newSize = CGRect(origin: CGPoint.zero, size: self.size).applying(CGAffineTransform(rotationAngle: CGFloat(radians))).size
        // Trim off the extremely small float value to prevent core graphics from rounding it up
        newSize.width = floor(newSize.width)
        newSize.height = floor(newSize.height)
        
        UIGraphicsBeginImageContextWithOptions(newSize, false, self.scale)
        guard let context = UIGraphicsGetCurrentContext() else { return nil }
        
        // Move origin to middle
        context.translateBy(x: newSize.width/2, y: newSize.height/2)
        // Rotate around middle
        context.rotate(by: CGFloat(radians))
        // Draw the image at its center
        self.draw(in: CGRect(x: -self.size.width/2, y: -self.size.height/2, width: self.size.width, height: self.size.height))
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage
    }
}
