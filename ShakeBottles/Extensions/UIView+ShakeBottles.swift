//
//  UIView+ShakeBottles.swift
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
    func cornerRadius(bounds: CGRect, topLeft: CGFloat, topRight: CGFloat, bottomLeft: CGFloat, bottomRight: CGFloat) {
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
    
    func cornerRadius(topLeft: CGFloat, topRight: CGFloat, bottomLeft: CGFloat, bottomRight: CGFloat) {
        cornerRadius(bounds: bounds, topLeft: topLeft, topRight: topRight, bottomLeft: bottomLeft, bottomRight: bottomRight)
    }
    
    // chat bubble arrows
    func rightBubbleArrowPath() -> CGPath {
        var b = bounds
        var topLeft: CGFloat
        var topRight: CGFloat
        var bottomRight: CGFloat
        var bottomLeft: CGFloat
        
        b.size.width -= AppearanceManager.shared.sizes.cornerRadiusM
        topLeft = AppearanceManager.shared.sizes.marginL
        topRight =  AppearanceManager.shared.sizes.marginM
        bottomLeft =  AppearanceManager.shared.sizes.marginL
        bottomRight =  AppearanceManager.shared.sizes.marginM
        
        let topLeftCenterX = b.minX + topLeft
        let topLeftCenterY = b.minY + topLeft

        let topRightCenterX = b.maxX - topRight
        let topRightCenterY = b.minY + topRight

        let bottomLeftCenterX = b.minX + bottomLeft
        let bottomLeftCenterY = b.maxY - bottomLeft

        let bottomRightCenterX = b.maxX - bottomRight
        let bottomRightCenterY = b.maxY - bottomRight
        
        let path = CGMutablePath()
        
        // Top Left
        path.addArc(center: CGPoint(x: topLeftCenterX, y: topLeftCenterY), radius: topLeft, startAngle: Double.pi, endAngle: 3 * Double.pi / 2, clockwise: false)
        // Top Right
        path.addArc(center: CGPoint(x: topRightCenterX, y: topRightCenterY), radius: topRight, startAngle: 3 * Double.pi / 2, endAngle: 0, clockwise: false)
        // Bottom Right Arrow
        path.addLine(to: CGPoint(x: b.maxX, y: b.maxY - 16))
        path.addQuadCurve(to: CGPoint(x: b.maxX + 10, y: b.maxY), control: CGPoint(x: b.maxX + 2, y: b.maxY - 5))
        path.addQuadCurve(to: CGPoint(x: b.maxX - 16, y: b.maxY - 8), control: CGPoint(x: b.maxX + 6, y: b.maxY))
        // Bottom Right Corner
        path.addArc(center: CGPoint(x: bottomRightCenterX - 8, y: bottomRightCenterY), radius: bottomRight, startAngle: Double.pi * 1 / 10, endAngle: Double.pi / 2, clockwise: false)
        // Bottom Left Arrow
        path.addArc(center: CGPoint(x: bottomLeftCenterX, y: bottomLeftCenterY), radius: bottomLeft, startAngle: Double.pi / 2, endAngle: Double.pi, clockwise: false)
        path.closeSubpath()
        return path
    }
    
    // mirror right arrow path
    func leftBubbleArrowPath() -> CGPath {
        var path = rightBubbleArrowPath()
        // Create two transforms, one to mirror across the x axis, and one to
        // to translate the resulting path back into the desired boundingRect
        var mirrorOverXOrigin: CGAffineTransform = CGAffineTransform.init(scaleX: -1.0, y: 1.0)
        var translate: CGAffineTransform =  CGAffineTransform.init(translationX: bounds.size.width, y: 0)
        path = path.mutableCopy(using: &mirrorOverXOrigin)!
        path = path.mutableCopy(using: &translate)!
        return path
    }
}
