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
    
    public static var defaultLight: UIPalette = .init()
    public static var defaultDark: UIPalette = .init(
        adaptive:   .dark,
        primary:    .init(color: "#D0BCFF", onColor: "#381E72", containerColor: "#4F378B", onContainerColor: "#EADDFF"),
        secondary:  .init(color: "#CCC2DC", onColor: "#332D41", containerColor: "#4A4458", onContainerColor: "#E8DEF8"),
        tertiary:   .init(color: "#EFB8C8", onColor: "#492532", containerColor: "#633B48", onContainerColor: "#FFD8E4"),
        error:      .init(color: "#F2B8B5", onColor: "#601410", containerColor: "#8C1D18", onContainerColor: "#F9DEDC"),
        background: .init(color: "#1C1B1F", onColor: "#E6E1E5", surface: "#1C1B1F", onSurface: "#E6E1E5"),
        neutral:    .init(outline: "#938F99", surfaceColor: "#49454F", onSurfaceColor: "#CAC4D0")
    )
    
    public var adaptive: Adaptive
    
    public var primary:    PrimaryColor
    public var secondary:  PrimaryColor
    public var tertiary:   PrimaryColor
    public var error:      PrimaryColor
    
    public var background: BackgroundColor
    public var neutral:    NeutralColor
    
    public init(
        adaptive: Adaptive =        .light,
        primary: PrimaryColor =     .init(color: "#6750A4", onColor: "#FFFFFF", containerColor: "#EADDFF", onContainerColor: "#21005D"),
        secondary: PrimaryColor =   .init(color: "#625B71", onColor: "#FFFFFF", containerColor: "#E8DEF8", onContainerColor: "#1D192B"),
        tertiary: PrimaryColor =    .init(color: "#7D5260", onColor: "#FFFFFF", containerColor: "#FFD8E4", onContainerColor: "#31111D"),
        error: PrimaryColor =       .init(color: "#B3261E", onColor: "#FFFFFF", containerColor: "#F9DEDC", onContainerColor: "#410E0B"),
        background: BackgroundColor = .init(color: "#FFFBFE", onColor: "#1C1B1F", surface: "#FFFBFE", onSurface: "#1C1B1F"),
        neutral: NeutralColor =     .init(outline: "#79747E", surfaceColor: "#E7E0EC", onSurfaceColor: "#49454F")
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
    
    public var color: UIColor
    public var onColor: UIColor
    public var containerColor: UIColor
    public var onContainerColor: UIColor
    
    public init(
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

    public var color: UIColor
    public var onColor: UIColor
    public var surface: UIColor
    public var onSurface: UIColor
 
    public init(
        color: String,
        onColor: String,
        surface: String,
        onSurface: String
    ) {
        self.color = .init(color)
        self.onColor = .init(onColor)
        self.surface = .init(surface)
        self.onSurface = .init(onSurface)
    }
}

public struct NeutralColor {
    
    public var outline: UIColor
    public var surfaceColor: UIColor
    public var onSurfaceColor: UIColor
    
    public init(
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

extension UIColor {
    
    /// Returns the current palette primary color
    public var primary: PrimaryColor {
        UITheme.main.active().primary
    }
    
    /// Returns the current palette secondary color
    public var secondary: PrimaryColor {
        UITheme.main.active().secondary
    }
    
    /// Returns the current palette tertiary color
    public var tertiary: PrimaryColor {
        UITheme.main.active().tertiary
    }
    
    /// Returns the current palette error color
    public var error: PrimaryColor {
        UITheme.main.active().error
    }
    
    /// Returns the current palette background color
    public var background: BackgroundColor {
        UITheme.main.active().background
    }
    
    /// Returns the current palette neutral color
    public var neutral: NeutralColor {
        UITheme.main.active().neutral
    }
}
