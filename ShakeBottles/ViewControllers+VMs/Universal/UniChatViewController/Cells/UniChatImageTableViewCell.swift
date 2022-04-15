//
// Created by Sines on 4/6/22.
//

import UIKit
import SnapKit

class UniChatImageTableViewCell: UITableViewCell {
    // internal
    private var imgView: UIImageView!
    private var timeLabel: UILabel!
    private var msgStatusView: UIImageView!
    private var bubbleContainer: UniChatCellBubbleView!
    
    // setter
    private var _side: UniChatCellSideType!
    private var side: UniChatCellSideType {
        set {
            _side = newValue
            if side == .me { // right
                bubbleContainer.snp.remakeConstraints { make in
                    make.leftMargin.greaterThanOrEqualTo(AppearanceManager.shared.sizes.marginChatBubbleL)
                    make.rightMargin.equalTo(-AppearanceManager.shared.sizes.marginL)
                    make.topMargin.equalTo(1)
                    make.bottomMargin.equalTo(-1)
                }
                msgStatusView.snp.updateConstraints { make in
                    make.width.equalTo(AppearanceManager.shared.sizes.fontSizeXS)
                }
            } else {  // left
                bubbleContainer.snp.remakeConstraints { make in
                    make.leftMargin.equalTo(AppearanceManager.shared.sizes.marginL)
                    make.rightMargin.lessThanOrEqualTo(-AppearanceManager.shared.sizes.marginChatBubbleL)
                    make.topMargin.equalTo(1)
                    make.bottomMargin.equalTo(-1)
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
    
    private var _cellModel: UniChatImageCellModel!
    private var cellModel: UniChatImageCellModel {
        set {
            _cellModel = newValue
            imgView.loadImage(from: _cellModel.imageURL, placeholder: UIImageView.placeholderImg, mode: .scaleAspectFill)
            timeLabel.text = _cellModel.timeStr
            msgStatusView.image = _cellModel.status.icon
        }
        get {
            return _cellModel
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
        imgView = UIImageView(frame: .zero)
        imgView.image = UIImageView.placeholderImg
        bubbleContainer.addSubview(imgView)
        
        timeLabel = UILabel(frame: .zero)
        timeLabel.font = timeLabel.font.withSize(AppearanceManager.shared.sizes.fontSizeXS)
        bubbleContainer.addSubview(timeLabel)
        
        msgStatusView = UIImageView(frame: .zero)
        bubbleContainer.addSubview(msgStatusView)
        
        imgView.snp.makeConstraints { make in
            make.topMargin.equalTo(0)
            make.bottomMargin.equalTo(0)
            make.leftMargin.equalTo(0)
            make.rightMargin.equalTo(0)
        }
        
        msgStatusView.snp.makeConstraints { make in
            make.rightMargin.equalTo(-AppearanceManager.shared.sizes.marginS)
            make.bottomMargin.equalTo(-AppearanceManager.shared.sizes.marginM)
            make.height.equalTo(AppearanceManager.shared.sizes.fontSizeXS)
            make.width.equalTo(0)
        }
        
        timeLabel.snp.makeConstraints { make in
            make.right.equalTo(msgStatusView.snp.left).offset(-AppearanceManager.shared.sizes.marginS)
            make.bottom.equalTo(msgStatusView.snp.bottom)
        }
    }
    
    public func update(withModel cellModel: UniChatImageCellModel, side: UniChatCellSideType, shape: UniChatCellShape = .round) {
        bubbleContainer.update(withSide: side, shape: shape)
        self.cellModel = cellModel
        self.side = side
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension UniChatImageTableViewCell {
    static let reuseIdentifier = "com.uniChat.UniChatImageTableViewCell"
}
