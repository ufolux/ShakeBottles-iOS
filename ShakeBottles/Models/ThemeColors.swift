//
//  ThemeColors.swift
//  ShakeBottles
//
//  Created by Sines on 4/7/22.
//

import UIKit

protocol ThemeColors {
    // MARK: - Bg
    var background: UIColor { get }
    var inputBg: UIColor { get }
    var placeholder: UIColor { get }
    
    // MARK: - Navigation Bar
    var navigationBarTitle: UIColor { get }
    var navigationBarSubtitle: UIColor { get }
    var navigationBarItem: UIColor { get }
    
    // MARK: - Chat Bubble
    var chatMeBubble: UIColor { get }
    var chatOtherBubble: UIColor { get }
    var chatMeBubbleTime: UIColor { get }
    var chatOtherBubbleTime: UIColor { get }
    var msgStatusNormal: UIColor { get }
    var msgStatusRead: UIColor { get }
    var msgStatusFailed: UIColor { get }
}

struct DefaultThemeColors: ThemeColors {
    // MARK: - Bg
    let background: UIColor = #colorLiteral(red: 0.9719485641, green: 0.9719484448, blue: 0.9719484448, alpha: 1)
    let inputBg: UIColor = #colorLiteral(red: 0.9240134358, green: 0.9240134358, blue: 0.9240134358, alpha: 1)
    let placeholder: UIColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)

    // MARK: - Navigation Bar
    let navigationBarTitle: UIColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    let navigationBarSubtitle: UIColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.5490196078)
    let navigationBarItem: UIColor = #colorLiteral(red: 0.03921568627, green: 0.5176470588, blue: 1, alpha: 1)

    // MARK: - Chat Bubble
    let chatMeBubble: UIColor = #colorLiteral(red: 0.583748877, green: 0.8637559414, blue: 0.9882481694, alpha: 1)
    let chatOtherBubble: UIColor = #colorLiteral(red: 0.7091121078, green: 0.7255905271, blue: 0.6991435885, alpha: 1)
    let chatMeBubbleTime: UIColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.2470588235)
    let chatOtherBubbleTime: UIColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.2470588235)
    let msgStatusNormal:UIColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
    let msgStatusRead: UIColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
    let msgStatusFailed: UIColor = #colorLiteral(red: 0.93915628, green: 0.03233111771, blue: 0.3944942503, alpha: 1)
}
