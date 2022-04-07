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
    var messageLabel: UILabel!
    var timeLabel: UILabel!
    var msgStatusView: UIView!
    let bubbleContainer = UIView(frame: .zero)
    
    let disposeBag = DisposeBag()
    
    init(withSideType sideType: UniChatCellSideType) {
        super.init(style: .default, reuseIdentifier: Self.reuseIdentifier)
        backgroundColor = UIColor.clear
        selectionStyle = .none
        contentView.backgroundColor = UIColor.clear
        
        bubbleContainer.backgroundColor = sideType == .me ? .link : .darkGray
        bubbleContainer.layer.cornerRadius = 8
        contentView.addSubview(bubbleContainer)
        bubbleContainer.snp.makeConstraints { make in
            make.trailing.equalTo(contentView.snp.trailing).offset(-8)
            make.leading.greaterThanOrEqualTo(contentView.snp.leading).offset(64)
            
            make.topMargin.equalTo(4)
            make.bottomMargin.equalTo(4)
        }
        let cornerRadii = CornerRadii(topLeft: 16, topRight: 8, bottomLeft: 16, bottomRight: 8)
        bubbleContainer.rx.observe(CGRect.self, #keyPath(UIView.bounds))
            .subscribe(onNext: { [weak self] _ in
                self?.bubbleContainer.cornerRadius(cornerRadii: cornerRadii)
            }).disposed(by: disposeBag)

        messageLabel = UILabel(frame: .zero)
        messageLabel.numberOfLines = 0
        messageLabel.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
        bubbleContainer.addSubview(messageLabel)
        
        timeLabel = UILabel(frame: .zero)
        timeLabel.text = "4:55 PM"
        bubbleContainer.addSubview(timeLabel)
        
        msgStatusView = UIView(frame: .zero)
        msgStatusView.backgroundColor = .systemPink
        bubbleContainer.addSubview(msgStatusView)
        
        msgStatusView.snp.makeConstraints { make in
            make.trailing.equalTo(bubbleContainer.snp.trailing).offset(-8)
            make.height.equalTo(20)
            make.width.equalTo(20)
            make.bottomMargin.equalTo(-8)
        }
        
        timeLabel.snp.makeConstraints { make in
            make.width.equalTo(80)
            make.right.equalTo(msgStatusView.snp.left).offset(2)
            make.bottom.equalTo(msgStatusView.snp.bottom)
        }
        
        messageLabel.snp.makeConstraints { make in
            make.bottom.equalTo(timeLabel.snp.bottom)
            make.topMargin.equalTo(8)
            make.leftMargin.equalTo(4)
            make.right.equalTo(timeLabel.snp.left).offset(8)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension UniChatTextTableViewCell {
    static let reuseIdentifier = "com.uniChat.UniChatTextTableViewCell"
}
