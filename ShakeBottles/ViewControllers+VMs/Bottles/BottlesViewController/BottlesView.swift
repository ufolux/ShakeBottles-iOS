//
//  BottlesView.swift
//  ShakeBottles
//
//  Created by Sines on 3/28/22.
//

import Foundation
import UIKit

class BottlesView: BaseView {
    private var vm: BottlesVM!
    private var navBar: NavigationBar!
    private var pickBottleBtn: UIButton!
    private var throwBottleBtn: UIButton!
    private var btnsStackV: UIStackView!
    private var bottleSeaV: BottleSeaView!
    
    init(vm: BottlesVM) {
        super.init(frame: .zero)
        self.vm = vm
        backgroundColor = AppearanceManager.shared.colors.background
                
        // sea
        bottleSeaV = BottleSeaView(vm: vm)
        self.addSubview(bottleSeaV)
        
        // buttons
        pickBottleBtn = UIButton(type: .system)
        throwBottleBtn = UIButton(type: .system)
        btnsStackV = UIStackView(arrangedSubviews: [pickBottleBtn, throwBottleBtn])
        self.addSubview(btnsStackV)
        
        btnsStackV.axis = .horizontal
        btnsStackV.spacing = 60
        btnsStackV.snp.makeConstraints { make in
            make.bottomMargin.equalTo(-UIUtil.tabBarHeight-AppearanceManager.shared.sizes.marginM)
            make.centerX.equalTo(self.snp.centerX)
        }
        
        let btnWidth = 120.0
        let btnBgc: UInt = 0xFFF3C960
        pickBottleBtn.layer.cornerRadius = btnWidth / 2
        pickBottleBtn.backgroundColor = UIColor(btnBgc)
        pickBottleBtn.setImage(UIImage(named: "NetImage")?.withRenderingMode(.alwaysOriginal), for: .normal)
        pickBottleBtn.imageView?.contentMode = .scaleAspectFit
        pickBottleBtn.imageEdgeInsets = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        pickBottleBtn.showsTouchWhenHighlighted = true
        pickBottleBtn.addTarget(self, action: #selector(pickBottleBtnClicked), for: .touchUpInside)
        pickBottleBtn.snp.makeConstraints { make in
            make.height.equalTo(btnWidth)
            make.width.equalTo(btnWidth)
        }
        
        throwBottleBtn.layer.cornerRadius = btnWidth / 2
        throwBottleBtn.backgroundColor = UIColor(btnBgc)
        throwBottleBtn.layer.setAffineTransform(CGAffineTransform.init(rotationAngle: .pi/4))
        throwBottleBtn.setImage(UIImage(named: "Bottle")?.withRenderingMode(.alwaysOriginal), for: .normal)
        throwBottleBtn.imageView?.contentMode = .scaleAspectFit
        throwBottleBtn.showsTouchWhenHighlighted = true
        throwBottleBtn.addTarget(self, action: #selector(throwBottleBtnClicked), for: .touchUpInside)
        throwBottleBtn.snp.makeConstraints { make in
            make.height.equalTo(btnWidth)
            make.width.equalTo(btnWidth)
        }
        
        
        navBar = NavigationBar()
        navBar.titleLabel.text = "Bottles"
        let msgBtn = UIButton(type: .system)
        msgBtn.setTitle("Messages", for: .normal)
        msgBtn.setTitleColor(.systemBlue, for: .normal)
        msgBtn.addTarget(self, action: #selector(messagesBtnClicked), for: .touchUpInside)
        navBar.rightButton = msgBtn
        addSubview(navBar)
        navBar.snp.makeConstraints { make in
            make.centerX.equalTo(self.snp.centerX)
            make.top.equalTo(UIUtil.statusBarHeight)
        }
        
        bottleSeaV.snp.makeConstraints { make in
            make.top.equalTo(navBar.snp.bottom)
            make.bottomMargin.equalTo(-UIUtil.tabBarHeight)
            make.leading.equalTo(self.snp.leading)
            make.trailing.equalTo(self.snp.trailing)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Actions
    @objc func pickBottleBtnClicked() {
        // TODO: 1
    }
    
    @objc func throwBottleBtnClicked() {
        // TODO: 2
    }
    
    @objc func messagesBtnClicked() {
        print("messages")
        vm.coordinator?.moveTo(flow: .bottle(.messages), userData: nil)
    }
}
