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

// init first then setDisplay after added to superview
class UniChatCellBubbleView: BaseView {
    // internal props
    private var side: UniChatCellSideType!
    private var shape: UniChatCellShape!
    private var showArrow: Bool!
    private let disposeBag = DisposeBag()
    
    init() {
        super.init(frame: .zero)
        rx.observe(CGRect.self, #keyPath(UIView.bounds))
            .subscribe(onNext: { [weak self] _ in
                self?.setNeedsDisplay()
            }).disposed(by: disposeBag)
        isUserInteractionEnabled = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setDisplay(side: UniChatCellSideType, shape: UniChatCellShape) {
        self.side = side
        self.shape = shape
        if side == .me {
            backgroundColor = AppearanceManager.shared.colors.chatMeBubble
            self.snp.remakeConstraints { make in
                make.leftMargin.greaterThanOrEqualTo(AppearanceManager.shared.sizes.marginChatBubbleL)
                make.rightMargin.equalTo(0)
                make.topMargin.equalTo(AppearanceManager.shared.sizes.marginS)
                make.bottomMargin.equalTo(-AppearanceManager.shared.sizes.marginS)
            }
        } else {
            backgroundColor = AppearanceManager.shared.colors.chatOtherBubble
            self.snp.remakeConstraints { make in
                make.leftMargin.equalTo(0)
                make.rightMargin.lessThanOrEqualTo(-AppearanceManager.shared.sizes.marginChatBubbleL)
                make.topMargin.equalTo(AppearanceManager.shared.sizes.marginS)
                make.bottomMargin.equalTo(-AppearanceManager.shared.sizes.marginS)
            }
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
