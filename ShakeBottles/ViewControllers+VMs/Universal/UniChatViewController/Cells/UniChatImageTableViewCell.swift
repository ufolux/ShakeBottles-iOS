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
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = UIColor.clear
        contentView.backgroundColor = UIColor.clear
        selectionStyle = .none
        
        bubbleContainer = UniChatCellBubbleView()
        contentView.addSubview(bubbleContainer)
        
        // init widgets
        imgView = UIImageView(frame: .zero)
        imgView.image = UIImageView.placeholderImg
        imgView.translatesAutoresizingMaskIntoConstraints = false
        bubbleContainer.addSubview(imgView)
        
        timeLabel = UILabel(frame: .zero)
        timeLabel.font = timeLabel.font.withSize(AppearanceManager.shared.sizes.fontSizeXS)
        bubbleContainer.addSubview(timeLabel)
        
        msgStatusView = UIImageView(frame: .zero)
        bubbleContainer.addSubview(msgStatusView)
        
        let size = scaledImageSize(size: UIImageView.placeholderImg.size)
        imgView.snp.makeConstraints { make in
            make.top.equalTo(self.bubbleContainer.snp.top)
            make.bottom.equalTo(self.bubbleContainer.snp.bottom)
            make.leading.equalTo(self.bubbleContainer.snp.leading)
            make.trailing.equalTo(self.bubbleContainer.snp.trailing)
            make.width.equalTo(size.width)
            make.height.equalTo(size.height).priority(.high)
        }
        
        msgStatusView.snp.makeConstraints { make in
            make.rightMargin.equalTo(-AppearanceManager.shared.sizes.marginL)
            make.bottomMargin.equalTo(-AppearanceManager.shared.sizes.marginM)
            make.height.equalTo(AppearanceManager.shared.sizes.fontSizeXS)
            make.width.equalTo(0)
        }
        
        timeLabel.snp.makeConstraints { make in
            make.right.equalTo(msgStatusView.snp.left).offset(-AppearanceManager.shared.sizes.marginS)
            make.bottom.equalTo(msgStatusView.snp.bottom)
        }
    }
    
    private func scaledImageSize(size: CGSize) -> CGSize {
        let baseWidth = 2160.0
        let maxWidth = UIUtil.screenWidth - AppearanceManager.shared.sizes.marginChatBubbleL
        var scaledSize = CGSize.zero
        if size.width > baseWidth {
            scaledSize.width = maxWidth
            scaledSize.height = maxWidth / size.width * size.height
        } else {
            let width = size.width / baseWidth * size.width
            if width > maxWidth {
                scaledSize.width = maxWidth
                scaledSize.height = maxWidth / size.width * size.height
            } else {
                scaledSize.width = width
                scaledSize.height = width / size.width * size.height
            }
        }
        return scaledSize
    }
    
    public func update(withModel cellModel: UniChatImageCellModel, side: UniChatCellSideType, shape: UniChatCellShape = .round) {
        imgView.loadImage(from: cellModel.imageURL, placeholder: UIImageView.placeholderImg, mode: .scaleAspectFill) { [weak self] image in
            let size = self!.scaledImageSize(size: image.size)
            self!.imgView.snp.updateConstraints { make in
                make.width.equalTo(size.width)
                make.height.equalTo(size.height).priority(.high)
            }
        }
        timeLabel.text = cellModel.timeStr
        msgStatusView.image = cellModel.status.icon
        
        if side == .me { // right
            msgStatusView.snp.updateConstraints { make in
                make.width.equalTo(AppearanceManager.shared.sizes.fontSizeXS)
            }
        } else {  // left
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


extension UniChatImageTableViewCell {
    static let reuseIdentifier = "com.uniChat.UniChatImageTableViewCell"
}
