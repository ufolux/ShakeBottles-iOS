//
//  AppearanceConfig.swift
//  ShakeBottles
//
//  Created by Sines on 3/28/22.
//

import Foundation

enum AppTheme {
    case Default
    case Dark
}

class AppearanceManager {
    static let shared = AppearanceManager()
    var colors: ThemeColors = DefaultThemeColors()
    var sizes: ThemeSizes = DefaultThemeSizes()

    func setTheme(theme: AppTheme) {
        switch theme {
        case .Default:
            colors = DefaultThemeColors()
        case .Dark:
            // TODO: Implement dark theme
            colors = DefaultThemeColors()
        }
    }

    func resetTheme() {
        colors = DefaultThemeColors()
        sizes = DefaultThemeSizes()
    }

    init() {
        // TODO: read theme from persisted data
        setTheme(theme: .Default)
    }

    func saveCurrentThemeToDisk() {
        // TODO: persist theme to disk
    }
}
