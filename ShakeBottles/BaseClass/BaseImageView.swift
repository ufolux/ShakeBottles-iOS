//
// Created by Sines on 3/25/22.
//

import Foundation
import UIKit

class BaseImageView: UIImageView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    func setup() {
        backgroundColor = UIColor.clear
        contentMode = .scaleAspectFill
        clipsToBounds = true
    }
}