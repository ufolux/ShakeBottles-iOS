//
//  ShakeBottles+UIView.swift
//  ShakeBottles
//
//  Created by Sines on 4/6/22.
//

import UIKit

struct CornerRadii {
    var topLeft: CGFloat
    var topRight: CGFloat
    var bottomLeft: CGFloat
    var bottomRight: CGFloat
}

extension UIView {
    func cornerRadius(topLeft: CGFloat, topRight: CGFloat, bottomLeft: CGFloat, bottomRight: CGFloat) {
        let topLeftCenterX = bounds.minX + topLeft
        let topLeftCenterY = bounds.minY + topLeft

        let topRightCenterX = bounds.maxX - topRight
        let topRightCenterY = bounds.minY + topRight

        let bottomLeftCenterX = bounds.minX + bottomLeft
        let bottomLeftCenterY = bounds.maxY - bottomLeft

        let bottomRightCenterX = bounds.maxX - bottomRight
        let bottomRightCenterY = bounds.maxY - bottomRight

        let path = CGMutablePath()
        
        // Top Left
        path.addArc(center: CGPoint(x: topLeftCenterX, y: topLeftCenterY), radius: topLeft, startAngle: Double.pi, endAngle: 3 * Double.pi / 2, clockwise: false)
        // Top Right
        path.addArc(center: CGPoint(x: topRightCenterX, y: topRightCenterY), radius: topRight, startAngle: 3 * Double.pi / 2, endAngle: 0, clockwise: false)
        // Bottom Right
        path.addArc(center: CGPoint(x: bottomRightCenterX, y: bottomRightCenterY), radius: bottomRight, startAngle: 0, endAngle: Double.pi / 2, clockwise: false)
        // Bottom Left
        path.addArc(center: CGPoint(x: bottomLeftCenterX, y: bottomLeftCenterY), radius: bottomLeft, startAngle: Double.pi / 2, endAngle: Double.pi, clockwise: false)
        path.closeSubpath()

        let mask = CAShapeLayer()
        mask.path = path
        layer.mask = mask
    }
}
