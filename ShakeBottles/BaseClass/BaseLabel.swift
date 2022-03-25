//
// Created by Sines on 3/25/22.
//

import Foundation
import UIKit

class BaseLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialize()
    }

    func initialize() {
        font = UIFont.systemFont(ofSize: 14)
        textColor = UIColor.black
        textAlignment = .left
    }
}