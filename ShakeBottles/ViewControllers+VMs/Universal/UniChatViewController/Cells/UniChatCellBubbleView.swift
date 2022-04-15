//
//  UniChatCellBubbleView.swift
//  ShakeBottles
//
//  Created by Sines on 4/7/22.
//

import UIKit
import SnapKit
import RxCocoa
import RxSwift

class UniChatCellBubbleView: BaseView {
    // internal props
    private var side: UniChatCellSideType!
    private var shape: UniChatCellShape!
    private var showArrow: Bool!
    private let disposeBag = DisposeBag()
    
    init(side: UniChatCellSideType, shape: UniChatCellShape) {
        super.init(frame: .zero)
        rx.observe(CGRect.self, #keyPath(UIView.bounds))
            .subscribe(onNext: { [weak self] _ in
                self!.draw(self!.bounds)
            }).disposed(by: disposeBag)
        update(withSide: side, shape: shape)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func update(withSide side: UniChatCellSideType, shape: UniChatCellShape = .round) {
        self.side = side
        self.shape = shape
        updateView(side: side)
    }
    
    private func updateView(side: UniChatCellSideType) {
        if side == .me {
            layoutMargins = UIEdgeInsets(top: AppearanceManager.shared.sizes.marginM,
                                         left: AppearanceManager.shared.sizes.marginL,
                                         bottom: AppearanceManager.shared.sizes.marginM,
                                         right: AppearanceManager.shared.sizes.marginL)
            backgroundColor = AppearanceManager.shared.colors.chatMeBubble
        } else {
            layoutMargins = UIEdgeInsets(top: AppearanceManager.shared.sizes.marginM,
                                         left: AppearanceManager.shared.sizes.marginL,
                                         bottom: AppearanceManager.shared.sizes.marginM,
                                         right: AppearanceManager.shared.sizes.marginL)
            backgroundColor = AppearanceManager.shared.colors.chatOtherBubble
        }
        setNeedsDisplay()
    }
    
    // Draw
    override func draw(_ rect: CGRect) {
        if side == .me {
            if (shape == .round) {
                drawMeNoArrow(rect)
            } else {
                drawMeArrow(rect)
            }
        } else {
            if (shape == .round) {
                drawOtherNoArrow(rect)
            } else {
                drawOtherArrow(rect)
            }
        }
    }
    
    private func drawMeNoArrow(_ rect: CGRect) {
        // MarginRight 4+8 = 12
        //  ------------        |
        // |            | .     |
        // |            | .     |
        //  ----------- \4.+8=12|
        //             \  |
        //              \ |
        var b = rect
        b.size.width -= AppearanceManager.shared.sizes.cornerRadiusM
        cornerRadius(bounds: b,
                     topLeft: AppearanceManager.shared.sizes.cornerRadiusL,
                     topRight: AppearanceManager.shared.sizes.cornerRadiusM,
                     bottomLeft: AppearanceManager.shared.sizes.cornerRadiusL,
                     bottomRight: AppearanceManager.shared.sizes.cornerRadiusM)
    }
    
    private func drawOtherNoArrow(_ rect: CGRect) {
        var b = rect
        b.origin.x += AppearanceManager.shared.sizes.cornerRadiusM
        b.size.width -= AppearanceManager.shared.sizes.cornerRadiusM
        cornerRadius(bounds: b,
                     topLeft: AppearanceManager.shared.sizes.cornerRadiusM,
                     topRight: AppearanceManager.shared.sizes.cornerRadiusL,
                     bottomLeft: AppearanceManager.shared.sizes.cornerRadiusM,
                     bottomRight: AppearanceManager.shared.sizes.cornerRadiusL)
    }
    
    private func drawMeArrow(_ :CGRect) {
        let path = rightBubbleArrowPath()
        let mask = CAShapeLayer()
        mask.path = path
        layer.shouldRasterize = true
        layer.rasterizationScale = UIScreen.main.scale
        layer.mask = mask
    }
    
    private func drawOtherArrow(_: CGRect) {
        let path = leftBubbleArrowPath()
        let mask = CAShapeLayer()
        mask.path = path
        layer.shouldRasterize = true
        layer.rasterizationScale = UIScreen.main.scale
        layer.mask = mask
    }
}
