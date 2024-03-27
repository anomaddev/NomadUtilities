//
//  UITheme.swift
//
//
//  Created by Justin Ackermann on 3/26/24.
//

import UIKit



class UITheme: NSObject {
    
    public static var main: UITheme = UITheme()
    
    public var light:   UIPalette = UIPalette()
    public var dark:    UIPalette = UIPalette()
    
    private override init() {
        super.init()
    }
    
}
