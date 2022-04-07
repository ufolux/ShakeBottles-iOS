//
//  ChatCellBubbleView.swift
//  ShakeBottles
//
//  Created by Sines on 4/7/22.
//

import UIKit

class ChatCellBubbleView: BaseView {
    var cellSideType: UniChatCellSideType!
    var showArrow: Bool!
    init(cellSideType: UniChatCellSideType, showArrow: Bool) {
        super.init(frame: .zero)
        self.cellSideType = cellSideType
        self.showArrow = showArrow
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        switch cellSideType {
        case .me:
            if showArrow {
                drawMeArrow(rect)
            } else {
                drawMeNoArrow(rect)
            }
        case .other:
            if showArrow {
                drawOtherArrow(rect)
            } else {
                drawOtherNoArrow(rect)
            }
        default:
            fatalError("func draw(_ rect: CGRect) cellSideType doesn't exist")
        }
    }
    
    private func drawMeNoArrow(_ rect: CGRect) {
        
    }
    
    private func drawOtherNoArrow(_ rect: CGRect) {
        
    }
    
    private func drawMeArrow(_ rect: CGRect) {
        
    }
    
    private func drawOtherArrow(_ rect: CGRect) {
        
    }
}
