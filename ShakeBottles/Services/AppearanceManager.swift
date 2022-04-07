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
    var currentThemeColors: ThemeColors = DefaultThemeColors()
    var currentThemeSizes: ThemeSizes = DefaultThemeSizes()

    func setTheme(theme: AppTheme) {
        switch theme {
        case .Default:
            currentThemeColors = DefaultThemeColors()
        case .Dark:
            // TODO: Implement dark theme
            currentThemeColors = DefaultThemeColors()
        }
    }

    func resetTheme() {
        currentThemeColors = DefaultThemeColors()
        currentThemeSizes = DefaultThemeSizes()
    }

    init() {
        // TODO: read theme from persisted data
        setTheme(theme: .Default)
    }

    func saveCurrentThemeToDisk() {
        // TODO: persist theme to disk
    }
}
