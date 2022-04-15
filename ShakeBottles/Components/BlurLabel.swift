//
//  BlurLabel.swift
//  ShakeBottles
//
//  Created by Sines on 4/14/22.
//

import UIKit

class BlurLabel: UILabel {
    init(text: String) {
        super.init(frame: .zero)
        self.text = text
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
