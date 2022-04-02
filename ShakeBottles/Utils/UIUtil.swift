//
//  UIUtil.swift
//  ShakeBottles
//
//  Created by Sines on 3/26/22.
//

import Foundation
import UIKit

class UIUtil {
    static var screenWidth: Double {
        get {
            return UIScreen.main.bounds.width
        }
    }
    
    static var screenHeight: Double {
        get {
            return UIScreen.main.bounds.height
        }
    }
    
    static var topSafeAreaHeight: Double {
        get {
            return UIApplication.shared.windows.first!.safeAreaInsets.top
        }
    }
    
    static var bottomSafeAreaHeight: Double {
        get {
            return UIApplication.shared.windows.first!.safeAreaInsets.bottom
        }
    }
    
    static var leftSafeAreaHeight: Double {
        get {
            return UIApplication.shared.windows.first!.safeAreaInsets.left
        }
    }
    
    static var rightSafeAreaHeight: Double {
        get {
            return UIApplication.shared.windows.first!.safeAreaInsets.right
        }
    }
}
