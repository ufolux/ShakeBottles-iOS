//
//  ThemeSizes.swift
//  ShakeBottles
//
//  Created by Sines on 4/7/22.
//

import UIKit


protocol ThemeSizes {
    // Device related
    var navigationBarHeight: CGFloat { get }
    var tabBarHeight: CGFloat { get }
    var statusBarHeight: CGFloat { get }
    var screenWidth: CGFloat { get }
    var screenHeight: CGFloat { get }

    // Fonts    
    var fontSizeExtraSmall: CGFloat { get }
    var fontSizeSmall: CGFloat { get }
    var fontSizeMedium: CGFloat { get }
    var fontSizeLarge: CGFloat { get }
    var fontSizeExtraLarge: CGFloat { get }

    // Margins
    var marginExtraSmall: CGFloat { get }
    var marginSmall: CGFloat { get }
    var marginMedium: CGFloat { get }
    var marginLarge: CGFloat { get }
    var marginExtraLarge: CGFloat { get }
    var marginChatBubleLarge: CGFloat { get }

    // Spacing
    var spacingExtraSmall: CGFloat { get }
    var spacingSmall: CGFloat { get }
    var spacingMedium: CGFloat { get }
    var spacingLarge: CGFloat { get }
    var spacingExtraLarge: CGFloat { get }

    // Corner Radius
    var cornerRadiusExtraSmall: CGFloat { get }
    var cornerRadiusSmall: CGFloat { get }
    var cornerRadiusMedium: CGFloat { get }
    var cornerRadiusLarge: CGFloat { get }
    var cornerRadiusExtraLarge: CGFloat { get }
}

struct DefaultThemeSizes: ThemeSizes {
    let navigationBarHeight: CGFloat = 64
    let tabBarHeight: CGFloat = 49
    let statusBarHeight: CGFloat = 20
    let screenWidth: CGFloat = UIScreen.main.bounds.width
    let screenHeight: CGFloat = UIScreen.main.bounds.height

    let fontSizeExtraSmall: CGFloat = 10
    let fontSizeSmall: CGFloat = 12
    let fontSizeMedium: CGFloat = 14
    let fontSizeLarge: CGFloat = 16
    let fontSizeExtraLarge: CGFloat = 18

    let marginExtraSmall: CGFloat = 2
    let marginSmall: CGFloat = 4
    let marginMedium: CGFloat = 8
    let marginLarge: CGFloat = 16
    let marginExtraLarge: CGFloat = 32
    var marginChatBubleLarge: CGFloat = 64

    let spacingExtraSmall: CGFloat = 2
    let spacingSmall: CGFloat = 4
    let spacingMedium: CGFloat = 8
    let spacingLarge: CGFloat = 16
    let spacingExtraLarge: CGFloat = 32

    let cornerRadiusExtraSmall: CGFloat = 2
    let cornerRadiusSmall: CGFloat = 4
    let cornerRadiusMedium: CGFloat = 8
    let cornerRadiusLarge: CGFloat = 16
    let cornerRadiusExtraLarge: CGFloat = 32
}


