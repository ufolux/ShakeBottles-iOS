//
// Created by Sines on 4/6/22.
//

import UIKit

class UniChatImageTableViewCell: UITableViewCell {
    init(withSideType sideType: UniChatCellSideType) {
        super.init(style: .default, reuseIdentifier: Self.reuseIdentifier)
    
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension UniChatImageTableViewCell {
    static let reuseIdentifier = "com.uniChat.UniChatImageTableViewCell"
}
