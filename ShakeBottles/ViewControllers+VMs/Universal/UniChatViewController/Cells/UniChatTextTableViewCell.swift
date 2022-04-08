//
// Created by Sines on 4/6/22.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

class UniChatTextTableViewCell: UITableViewCell {
    // TODO:
    // 1. cell type:  others, mine
    // 2. others: left bottom arrow, dark color
    // 3. mine: right bottom arrow, light color, read status
    var bubbleContainer: UniChatCellBubbleView!
    
    init(withSide side: UniChatCellSideType, shape: UniChatCellShape = .round) {
        super.init(style: .default, reuseIdentifier: Self.reuseIdentifier)
        backgroundColor = UIColor.clear
        contentView.backgroundColor = UIColor.clear
        selectionStyle = .none

        bubbleContainer = UniChatCellBubbleView(side: side, shape: shape)
        contentView.addSubview(bubbleContainer)
        if side == .me { // right
            bubbleContainer.snp.makeConstraints { make in
                make.leading.greaterThanOrEqualTo(contentView.snp.leading).offset(AppearanceManager.shared.sizes.marginChatBubbleL)
                make.trailing.equalTo(contentView.snp.trailing).offset(-AppearanceManager.shared.sizes.marginM)
                make.topMargin.equalTo(AppearanceManager.shared.sizes.marginS)
                make.bottomMargin.equalTo(AppearanceManager.shared.sizes.marginS)
            }
        } else {  // left
            bubbleContainer.snp.makeConstraints { make in
                make.leading.greaterThanOrEqualTo(contentView.snp.leading).offset(AppearanceManager.shared.sizes.marginM)
                make.trailing.equalTo(contentView.snp.trailing).offset(-AppearanceManager.shared.sizes.marginChatBubbleL)
                make.topMargin.equalTo(AppearanceManager.shared.sizes.marginS)
                make.bottomMargin.equalTo(AppearanceManager.shared.sizes.marginS)
            }
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension UniChatTextTableViewCell {
    static let reuseIdentifier = "com.uniChat.UniChatTextTableViewCell"
}
