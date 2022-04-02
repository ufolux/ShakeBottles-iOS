//
//  UIColorModel.swift
//  ShakeBottles
//
//  Created by Sines on 3/28/22.
//

import Foundation
import UIKit

protocol ShakeBottlesTheme {
    var background: UIColor { get }
}

extension UIColor {
    struct DefaultTheme: ShakeBottlesTheme {
        var background: UIColor = UIColor(0xf6f6f6)
    }
}
