//
//  AppearanceConfig.swift
//  ShakeBottles
//
//  Created by Sines on 3/28/22.
//

import Foundation
import UIKit



class AppearanceManager {
    static let sharedInstance = AppearanceManager()
    
    var currentTheme: ShakeBottlesTheme = UIColor.DefaultTheme()
}
