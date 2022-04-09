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
    // Property
    var side: UniChatCellSideType!
    var shape: UniChatCellShape!
    var showArrow: Bool!
    let disposeBag = DisposeBag()
    
    // Component
    var messageLabel: UILabel!
    var timeLabel: UILabel!
    var msgStatusView: UIView!
    
    init(side: UniChatCellSideType, shape: UniChatCellShape) {
        super.init(frame: .zero)
        self.side = side
        self.shape = shape
        backgroundColor = side == .me ?
        AppearanceManager.shared.colors.chatMeBubble :
        AppearanceManager.shared.colors.chatOtherBubble
        rx.observe(CGRect.self, #keyPath(UIView.bounds))
            .subscribe(onNext: { [weak self] _ in
                self!.draw(self!.bounds)
            }).disposed(by: disposeBag)
        setupView(side: side)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView(side: UniChatCellSideType) {
        // labels
        // TODO: Provide Data
        messageLabel = UILabel(frame: .zero)
        messageLabel.numberOfLines = 0
        messageLabel.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
        addSubview(messageLabel)
        
        timeLabel = UILabel(frame: .zero)
        timeLabel.text = "4:55 PM"
        timeLabel.font = timeLabel.font.withSize(AppearanceManager.shared.sizes.fontSizeXS)
        addSubview(timeLabel)
        
        msgStatusView = UIView(frame: .zero)
        msgStatusView.backgroundColor = .systemPink
        addSubview(msgStatusView)
        
        
        msgStatusView.snp.makeConstraints { make in
            make.rightMargin.equalTo(-AppearanceManager.shared.sizes.marginM)
            make.height.equalTo(AppearanceManager.shared.sizes.fontSizeXXS)
            make.width.equalTo(AppearanceManager.shared.sizes.fontSizeXXS)
            make.bottomMargin.equalTo(-AppearanceManager.shared.sizes.marginM)
        }
        
        timeLabel.snp.makeConstraints { make in
            make.right.equalTo(msgStatusView.snp.left).offset(2)
            make.bottom.equalTo(msgStatusView.snp.bottom)
        }
        
        messageLabel.snp.makeConstraints { make in
            make.bottom.equalTo(timeLabel.snp.bottom)
            make.topMargin.equalTo(AppearanceManager.shared.sizes.marginM)
            make.leftMargin.equalTo(AppearanceManager.shared.sizes.marginS)
            make.right.equalTo(timeLabel.snp.left).offset(AppearanceManager.shared.sizes.marginM)
        }
        
        if side == .me {
            layoutMargins = UIEdgeInsets(top: AppearanceManager.shared.sizes.marginM,
                                         left: AppearanceManager.shared.sizes.marginL,
                                         bottom: AppearanceManager.shared.sizes.marginM,
                                         right: AppearanceManager.shared.sizes.marginL)
        } else {
            layoutMargins = UIEdgeInsets(top: AppearanceManager.shared.sizes.marginM,
                                         left: AppearanceManager.shared.sizes.marginL,
                                         bottom: AppearanceManager.shared.sizes.marginM,
                                         right: AppearanceManager.shared.sizes.marginL)
        }
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
