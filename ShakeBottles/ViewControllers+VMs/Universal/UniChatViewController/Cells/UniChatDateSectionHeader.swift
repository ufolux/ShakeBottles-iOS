//
// Created by Sines on 4/6/22.
//

import UIKit

class UniChatDateSectionHeader: UIView {
    static let reuseIdentifierStr: String = "com.uniChat.UniChatDateTableViewCell"
    
    var dateLabel: UILabel!
    
    // MARK: - Article for blur uilabel
    init(cellModel: UniDateSectionModel) {
        super.init(frame: .zero)
        dateLabel = PaddingLabel(withInsetsTop: 2, 2, 16, 16)
        dateLabel.text = cellModel.dateStr
        dateLabel.textColor = .white
        dateLabel.font.withSize(8)
        dateLabel.backgroundColor = .clear
        dateLabel.frame = CGRect(origin: .zero, size: dateLabel.intrinsicContentSize)
        
        let blurEffect = UIBlurEffect(style: .systemThinMaterialLight)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.clipsToBounds = true
        blurView.layer.cornerRadius = 12
        blurView.frame = dateLabel.frame
        
        let vibrancyEffect = UIVibrancyEffect(blurEffect: blurEffect)
        let vibrancyView = UIVisualEffectView(effect: vibrancyEffect)
        vibrancyView.frame = dateLabel.frame
        vibrancyView.contentView.addSubview(dateLabel)
        
        blurView.contentView.addSubview(vibrancyView)
        blurView.center = CGPoint(x: UIUtil.screenWidth / 2.0, y: Self.height / 2.0)
        addSubview(blurView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension UniChatDateSectionHeader {
    static let height: CGFloat = 30.0
}
