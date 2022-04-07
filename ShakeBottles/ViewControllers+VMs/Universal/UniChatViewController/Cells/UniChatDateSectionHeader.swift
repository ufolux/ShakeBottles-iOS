//
// Created by Sines on 4/6/22.
//

import UIKit

class UniChatDateSectionHeader: UIView {
    static let reuseIdentifierStr: String = "com.uniChat.UniChatDateTableViewCell"
    
    var dateLabel: UILabel!
    
    init(cellModel: UniDateSectionModel) {
        super.init(frame: .zero)
        self.backgroundColor = .green
        
        dateLabel = PaddingLabel(withInsetsTop: 2, 2, 16, 16)
        dateLabel.text = cellModel.dateStr
        dateLabel.textColor = .white
        dateLabel.font.withSize(8)
        dateLabel.backgroundColor = UIColor(0xAEA29620)
        dateLabel.clipsToBounds = true
        dateLabel.layer.cornerRadius = 12
        
        addSubview(dateLabel)
        dateLabel.snp.makeConstraints { make in
            make.center.equalTo(self.snp.center)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
