//
//  UIPalette.swift
//
//
//  Created by Justin Ackermann on 3/26/24.
//

import UIKit
import UIColorHexSwift

// TODO: Make optional to fallback on default values if not specified

public class UIPalette {
    
    static var defaultLight: UIPalette = .init()
    static var defaultDark: UIPalette = .init(
        adaptive: .dark,
        primary: .init(color: "#D0BCFF", onColor: "#381E72", containerColor: "#4F378B", onContainerColor: "#EADDFF"),
        secondary: .init(color: "#CCC2DC", onColor: "#332D41", containerColor: "#4A4458", onContainerColor: "#E8DEF8"),
        tertiary: .init(color: "#EFB8C8", onColor: "#492532", containerColor: "#633B48", onContainerColor: "#FFD8E4"),
        error: .init(color: "#F2B8B5", onColor: "#601410", containerColor: "#8C1D18", onContainerColor: "#F9DEDC"),
        background: .init(background: "#1C1B1F", onBackground: "#E6E1E5", surface: "#1C1B1F", onSurface: "#E6E1E5"),
        neutral: .init(outline: "#938F99", surfaceColor: "#49454F", onSurfaceColor: "#CAC4D0")
    )
    
    var adaptive: Adaptive
    
    var primary:    PrimaryColor
    var secondary:  PrimaryColor
    var tertiary:   PrimaryColor
    var error:      PrimaryColor
    
    var background: BackgroundColor
    var neutral:    NeutralColor
    
    init(
        adaptive: Adaptive = .light,
        primary: PrimaryColor = .init(color: "#6750A4", onColor: "#FFFFFF", containerColor: "#EADDFF", onContainerColor: "#21005D"),
        secondary: PrimaryColor = .init(color: "#625B71", onColor: "#FFFFFF", containerColor: "#E8DEF8", onContainerColor: "#1D192B"),
        tertiary: PrimaryColor = .init(color: "#7D5260", onColor: "#FFFFFF", containerColor: "#FFD8E4", onContainerColor: "#31111D"),
        error: PrimaryColor = .init(color: "#B3261E", onColor: "#FFFFFF", containerColor: "#F9DEDC", onContainerColor: "#410E0B"),
        background: BackgroundColor = .init(background: "#FFFBFE", onBackground: "#1C1B1F", surface: "#FFFBFE", onSurface: "#1C1B1F"),
        neutral: NeutralColor = .init(outline: "#79747E", surfaceColor: "#E7E0EC", onSurfaceColor: "#49454F")
    ) {
        self.adaptive = adaptive
        self.primary = primary
        self.secondary = secondary
        self.tertiary = tertiary
        self.error = error
        
        self.background = background
        self.neutral = neutral
    }
}

public struct PrimaryColor {
    
    var color: UIColor
    var onColor: UIColor
    var containerColor: UIColor
    var onContainerColor: UIColor
    
    init(
        color: String,
        onColor: String,
        containerColor: String,
        onContainerColor: String
    ) {
        self.color = .init(color)
        self.onColor = .init(onColor)
        self.containerColor = .init(containerColor)
        self.onContainerColor = .init(onContainerColor)
    }
}

public struct BackgroundColor {

    var background: UIColor
    var onBackground: UIColor
    var surface: UIColor
    var onSurface: UIColor
 
    init(
        background: String,
        onBackground: String,
        surface: String,
        onSurface: String
    ) {
        self.background = .init(background)
        self.onBackground = .init(onBackground)
        self.surface = .init(surface)
        self.onSurface = .init(onSurface)
    }
}

public struct NeutralColor {
    
    var outline: UIColor
    var surfaceColor: UIColor
    var onSurfaceColor: UIColor
    
    init(
        outline: String,
        surfaceColor: String,
        onSurfaceColor: String
    ) {
        self.outline = .init(outline)
        self.surfaceColor = .init(surfaceColor)
        self.onSurfaceColor = .init(onSurfaceColor)
    }
}

public enum Adaptive {
    case light
    case dark
}

public extension UIColor {
    
    /// Returns the current palette primary color
    var primary: PrimaryColor {
        UITheme.main.active().primary
    }
    
    /// Returns the current palette secondary color
    var secondary: PrimaryColor {
        UITheme.main.active().secondary
    }
    
    /// Returns the current palette tertiary color
    var tertiary: PrimaryColor {
        UITheme.main.active().tertiary
    }
    
    /// Returns the current palette error color
    var error: PrimaryColor {
        UITheme.main.active().error
    }
    
    /// Returns the current palette background color
    var background: BackgroundColor {
        UITheme.main.active().background
    }
    
    /// Returns the current palette neutral color
    var neutral: NeutralColor {
        UITheme.main.active().neutral
    }
}
