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
    func cornerRadius(radius: CGFloat, roudingCorners: UIRectCorner) -> Void {
        let maskPath = UIBezierPath(roundedRect: bounds, byRoundingCorners: roudingCorners, cornerRadii: CGSize(width: radius, height: radius))
        let maskLayer = CAShapeLayer()
        maskLayer.frame = bounds
        maskLayer.path = maskPath.cgPath
        maskLayer.shouldRasterize = true
        maskLayer.rasterizationScale = UIScreen.main.scale
        layer.mask = maskLayer
    }
    
    func cornerRadius(cornerRadii: CornerRadii) {
        let topLeftCenterX = bounds.minX + cornerRadii.topLeft
        let topLeftCenterY = bounds.minY + cornerRadii.topLeft

        let topRightCenterX = bounds.maxX - cornerRadii.topRight
        let topRightCenterY = bounds.minY + cornerRadii.topRight

        let bottomLeftCenterX = bounds.minX + cornerRadii.bottomLeft
        let bottomLeftCenterY = bounds.maxY - cornerRadii.bottomLeft

        let bottomRightCenterX = bounds.maxX - cornerRadii.bottomRight
        let bottomRightCenterY = bounds.maxY - cornerRadii.bottomRight

        let path = CGMutablePath()
        
        // Top Left
        path.addArc(center: CGPoint(x: topLeftCenterX, y: topLeftCenterY), radius: cornerRadii.topLeft, startAngle: Double.pi, endAngle: 3 * Double.pi / 2, clockwise: false)
        // Top Right
        path.addArc(center: CGPoint(x: topRightCenterX, y: topRightCenterY), radius: cornerRadii.topRight, startAngle: 3 * Double.pi / 2, endAngle: 0, clockwise: false)
        // Bottom Right
        path.addArc(center: CGPoint(x: bottomRightCenterX, y: bottomRightCenterY), radius: cornerRadii.bottomRight, startAngle: 0, endAngle: Double.pi / 2, clockwise: false)
        // Bottom Left
        path.addArc(center: CGPoint(x: bottomLeftCenterX, y: bottomLeftCenterY), radius: cornerRadii.bottomLeft, startAngle: Double.pi / 2, endAngle: Double.pi, clockwise: false)
        path.closeSubpath()

        let mask = CAShapeLayer()
        mask.path = path
        layer.mask = mask
    }
}
