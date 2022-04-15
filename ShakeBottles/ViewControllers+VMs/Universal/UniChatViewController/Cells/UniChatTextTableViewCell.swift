//
// Created by Sines on 4/6/22.
//

import UIKit
import SnapKit

class UniChatTextTableViewCell: UITableViewCell {
    // TODO:
    // 1. cell type:  others, mine
    // 2. others: left bottom arrow, dark color
    // 3. mine: right bottom arrow, light color, read status
    // public
    
    // internal
    private var messageLabel: UILabel!
    private var timeLabel: UILabel!
    private var msgStatusView: UIImageView!
    private var bubbleContainer: UniChatCellBubbleView!
    
    // setter
    private var _cellModel: UniChatTextCellModel!
    private var cellModel: UniChatTextCellModel {
        set {
            _cellModel = newValue
            messageLabel.text = _cellModel.message
            timeLabel.text = _cellModel.timeStr
            msgStatusView.image = _cellModel.status.icon
        }
        get {
            return _cellModel
        }
    }
    
    private var _side: UniChatCellSideType!
    private var side: UniChatCellSideType {
        set {
            _side = newValue
            if side == .me { // right
                bubbleContainer.snp.remakeConstraints { make in
                    make.leftMargin.equalTo(AppearanceManager.shared.sizes.marginChatBubbleL)
                    make.rightMargin.equalTo(-AppearanceManager.shared.sizes.marginL)
                    make.topMargin.equalTo(AppearanceManager.shared.sizes.marginS)
                    make.bottomMargin.equalTo(AppearanceManager.shared.sizes.marginS)
                }
                msgStatusView.snp.updateConstraints { make in
                    make.width.equalTo(AppearanceManager.shared.sizes.fontSizeXS)
                }
            } else {  // left
                bubbleContainer.snp.remakeConstraints { make in
                    make.leftMargin.equalTo(AppearanceManager.shared.sizes.marginL)
                    make.rightMargin.equalTo(-AppearanceManager.shared.sizes.marginChatBubbleL)
                    make.topMargin.equalTo(AppearanceManager.shared.sizes.marginS)
                    make.bottomMargin.equalTo(AppearanceManager.shared.sizes.marginS)
                }
                msgStatusView.snp.updateConstraints { make in
                    make.width.equalTo(0)
                }
            }
            updateConstraints()
            updateConstraintsIfNeeded()
            layoutIfNeeded()
        }
        get {
            return _side
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = UIColor.clear
        contentView.backgroundColor = UIColor.clear
        selectionStyle = .none
        
        bubbleContainer = UniChatCellBubbleView(side: .me, shape: .round)
        contentView.addSubview(bubbleContainer)
        
        // init widgets
        messageLabel = UILabel(frame: .zero)
        messageLabel.numberOfLines = 0
        bubbleContainer.addSubview(messageLabel)
        
        timeLabel = UILabel(frame: .zero)
        timeLabel.font = timeLabel.font.withSize(AppearanceManager.shared.sizes.fontSizeXS)
        bubbleContainer.addSubview(timeLabel)
        
        msgStatusView = UIImageView(frame: .zero)
        bubbleContainer.addSubview(msgStatusView)
        
        messageLabel.snp.makeConstraints { make in
            make.topMargin.equalTo(AppearanceManager.shared.sizes.marginM)
            make.leftMargin.equalTo(AppearanceManager.shared.sizes.marginS)
            make.rightMargin.equalTo(AppearanceManager.shared.sizes.marginS)
        }
        
        msgStatusView.snp.makeConstraints { make in
            make.rightMargin.equalTo(-AppearanceManager.shared.sizes.marginS)
            make.bottomMargin.equalTo(-AppearanceManager.shared.sizes.marginM)
            make.top.equalTo(messageLabel.snp.bottom).offset(AppearanceManager.shared.sizes.marginS)
            make.height.equalTo(AppearanceManager.shared.sizes.fontSizeXS)
            make.width.equalTo(0)
        }
        
        timeLabel.snp.makeConstraints { make in
            make.right.equalTo(msgStatusView.snp.left).offset(-AppearanceManager.shared.sizes.marginS)
            make.bottom.equalTo(msgStatusView.snp.bottom)
        }
    }
    
    public func update(withModel cellModel: UniChatTextCellModel, side: UniChatCellSideType, shape: UniChatCellShape = .round) {
        bubbleContainer.update(withSide: side, shape: shape)
        self.cellModel = cellModel
        self.side = side
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension UniChatTextTableViewCell {
    static let reuseIdentifier = "com.uniChat.UniChatTextTableViewCell"
}
