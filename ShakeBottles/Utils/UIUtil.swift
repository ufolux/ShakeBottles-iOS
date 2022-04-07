//
//  UIUtil.swift
//  ShakeBottles
//
//  Created by Sines on 3/26/22.
//

import Foundation
import UIKit

class UIUtil {
    // MARK: - Screen
    static let screenWidth = UIScreen.main.bounds.width
    static let screenHeight = UIScreen.main.bounds.height
    
    // MARK: - Safe Area
    static let topSafeAreaHeight = UIApplication.shared.windows.first!.safeAreaInsets.top
    static let bottomSafeAreaHeight = UIApplication.shared.windows.first!.safeAreaInsets.bottom
    static let leftSafeAreaHeight = UIApplication.shared.windows.first!.safeAreaInsets.left
    static let rightSafeAreaHeight = UIApplication.shared.windows.first!.safeAreaInsets.right
}
