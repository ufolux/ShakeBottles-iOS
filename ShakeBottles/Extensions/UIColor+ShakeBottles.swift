//
//  UIColor+ShakeBottles.swift
//  ShakeBottles
//
//  Created by Sines on 3/27/22.
//

import Foundation
import UIKit

extension UIColor {
    convenience init(_ hexVal: UInt) {
        var r: UInt = 0, g: UInt = 0, b: UInt = 0;
        var a: UInt = 0xFF
        var rgb = hexVal
        
        if (hexVal & 0xFFFF0000) == 0 {
            a = 0xF
            
            if hexVal & 0xF000 > 0 {
                a = hexVal & 0xF
                rgb = hexVal >> 4
            }
            
            r = (rgb & 0xF00) >> 8
            r = (r << 4) | r
            
            g = (rgb & 0xF0) >> 4
            g = (g << 4) | g
            
            b = rgb & 0xF
            b = (b << 4) | b
            
            a = (a << 4) | a
            
        } else {
            if hexVal & 0xFF000000 > 0 {
                a = hexVal & 0xFF
                rgb = hexVal >> 8
            }
            
            r = (rgb & 0xFF0000) >> 16
            g = (rgb & 0xFF00) >> 8
            b = rgb & 0xFF
        }
        
        self.init(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: CGFloat(a) / 255.0)
    }
}
