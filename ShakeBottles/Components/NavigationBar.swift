//
//  NavigationBar.swift
//  ShakeBottles
//
//  Created by Sines on 4/14/22.
//

import UIKit
import SnapKit

class NavigationBar: UIView {
    var titleLabel: UILabel!
    
    private var _leftButton: UIButton!
    var leftButton: UIButton {
        set {
            if _leftButton != nil {
                _leftButton.removeFromSuperview()
            }
            _leftButton = newValue
            _leftButton.titleLabel?.font = _leftButton.titleLabel?.font.withSize(17)
            addSubview(_leftButton)
            _leftButton.snp.makeConstraints { make in
                make.leftMargin.equalTo(8)
                make.centerY.equalTo(self.snp.centerY)
            }
        }
        get {
            return _leftButton
        }
    }
    private var _rightButton: UIButton!
    var rightButton: UIButton {
        set {
            if _rightButton != nil {
                _rightButton.removeFromSuperview()
            }
            _rightButton = newValue
            _rightButton.titleLabel?.font = _rightButton.titleLabel?.font.withSize(17)
            addSubview(_rightButton)
            _rightButton.snp.makeConstraints { make in
                make.rightMargin.equalTo(-8)
                make.centerY.equalTo(self.snp.centerY)
            }
        }
        get {
            return _rightButton
        }
    }
    
    init() {
        super.init(frame: .zero)
        titleLabel = UILabel()
        titleLabel.backgroundColor = .clear
        titleLabel.textColor = .black
        titleLabel.font = titleLabel.font.withSize(17)
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalTo(self.snp.centerX)
            make.centerY.equalTo(self.snp.centerY)
        }
        self.snp.makeConstraints { make in
            make.height.equalTo(UIUtil.navigationBarHeight)
            make.width.equalTo(UIUtil.screenWidth)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
