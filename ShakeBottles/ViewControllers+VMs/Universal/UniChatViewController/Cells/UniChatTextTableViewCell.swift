//
// Created by Sines on 4/6/22.
//

import UIKit
import SnapKit

class UniChatTextTableViewCell: UITableViewCell {
    // internal
    private var messageLabel: UILabel!
    private var timeLabel: UILabel!
    private var msgStatusView: UIImageView!
    private var bubbleContainer: UniChatCellBubbleView!

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = UIColor.clear
        contentView.backgroundColor = UIColor.clear
        selectionStyle = .none
        
        bubbleContainer = UniChatCellBubbleView()
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
            make.leftMargin.equalTo(AppearanceManager.shared.sizes.marginM)
            make.rightMargin.equalTo(-AppearanceManager.shared.sizes.marginM)
        }
        
        msgStatusView.snp.makeConstraints { make in
            make.rightMargin.equalTo(-AppearanceManager.shared.sizes.marginL)
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
        
        messageLabel.text = cellModel.message
        timeLabel.text = cellModel.timeStr
        msgStatusView.image = cellModel.status.icon
        
        if side == .me { // right
            messageLabel.snp.updateConstraints { make in
                make.leftMargin.equalTo(AppearanceManager.shared.sizes.marginM)
                make.rightMargin.equalTo(-AppearanceManager.shared.sizes.marginL)
            }
            msgStatusView.snp.updateConstraints { make in
                make.width.equalTo(AppearanceManager.shared.sizes.fontSizeXS)
            }
        } else {  // left
            messageLabel.snp.updateConstraints { make in
                make.leftMargin.equalTo(AppearanceManager.shared.sizes.marginL)
                make.rightMargin.equalTo(-AppearanceManager.shared.sizes.marginM)
            }
            msgStatusView.snp.updateConstraints { make in
                make.width.equalTo(0)
            }
        }
        bubbleContainer.setDisplay(side: side, shape: shape)
        updateConstraints()
        updateConstraintsIfNeeded()
        layoutIfNeeded()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension UniChatTextTableViewCell {
    static let reuseIdentifier = "com.uniChat.UniChatTextTableViewCell"
}
