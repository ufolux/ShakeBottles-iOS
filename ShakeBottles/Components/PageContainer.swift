//
//  PageContainer.swift
//  ShakeBottles
//
//  Created by Sines on 4/14/22.
//

import UIKit
import SnapKit

class PageContainer: BaseScrollView {
    init() {
        super.init(frame: .zero)
        isScrollEnabled = true
        showsVerticalScrollIndicator = false
        showsHorizontalScrollIndicator = false
    }
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        self.snp.makeConstraints { make in
            make.topMargin.equalTo(0)
            make.bottomMargin.equalTo(0)
            make.leading.equalTo(superview!.snp.leading)
            make.trailing.equalTo(superview!.snp.trailing)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
