//
//  ThemeSizes.swift
//  ShakeBottles
//
//  Created by Sines on 4/7/22.
//

import UIKit


protocol ThemeSizes {
    var buttonSize: CGFloat { get }
    var inputHeight: CGFloat { get }

    // Fonts
    var fontSizeXXS: CGFloat { get }
    var fontSizeXS: CGFloat { get }
    var fontSizeS: CGFloat { get }
    var fontSizeM: CGFloat { get }
    var fontSizeL: CGFloat { get }
    var fontSizeXL: CGFloat { get }

    // Margins
    var marginXS: CGFloat { get }
    var marginS: CGFloat { get }
    var marginM: CGFloat { get }
    var marginL: CGFloat { get }
    var marginXL: CGFloat { get }
    var marginChatBubbleL: CGFloat { get }

    // Spacing
    var spacingXS: CGFloat { get }
    var spacingS: CGFloat { get }
    var spacingM: CGFloat { get }
    var spacingL: CGFloat { get }
    var spacingXL: CGFloat { get }

    // Corner Radius
    var cornerRadiusXS: CGFloat { get }
    var cornerRadiusS: CGFloat { get }
    var cornerRadiusM: CGFloat { get }
    var cornerRadiusL: CGFloat { get }
    var cornerRadiusXL: CGFloat { get }
}

struct DefaultThemeSizes: ThemeSizes {
    let buttonSize: CGFloat = 44
    let inputHeight: CGFloat = 37
    
    let fontSizeXXS: CGFloat = 8
    let fontSizeXS: CGFloat = 10
    let fontSizeS: CGFloat = 12
    let fontSizeM: CGFloat = 14
    let fontSizeL: CGFloat = 16
    let fontSizeXL: CGFloat = 18

    let marginXS: CGFloat = 2
    let marginS: CGFloat = 4
    let marginM: CGFloat = 8
    let marginL: CGFloat = 16
    let marginXL: CGFloat = 32
    var marginChatBubbleL: CGFloat = 64

    let spacingXS: CGFloat = 2
    let spacingS: CGFloat = 4
    let spacingM: CGFloat = 8
    let spacingL: CGFloat = 16
    let spacingXL: CGFloat = 32

    let cornerRadiusXS: CGFloat = 2
    let cornerRadiusS: CGFloat = 4
    let cornerRadiusM: CGFloat = 8
    let cornerRadiusL: CGFloat = 16
    let cornerRadiusXL: CGFloat = 32
}


