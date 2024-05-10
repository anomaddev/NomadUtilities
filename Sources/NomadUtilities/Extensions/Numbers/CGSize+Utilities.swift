//
//  File.swift
//  
//
//  Created by Justin Ackermann on 5/9/24.
//

import UIKit

extension CGSize {
    
    public static func square(_ size: CGFloat) -> CGSize {
        return CGSize(width: size, height: size)
    }
    
    static func rectangle(_ x: CGFloat,_ y: CGFloat) -> CGSize {
        return CGSize(width: x, height: y)
    }
}
