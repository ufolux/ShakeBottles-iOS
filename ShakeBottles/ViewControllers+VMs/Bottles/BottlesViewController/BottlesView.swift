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
    private var pickBottleBtn: UIButton!
    private var throwBottleBtn: UIButton!
    private var btnsStackV: UIStackView!
    private var bottleSeaV: BottleSeaView!
    
    init(vm: BottlesVM) {
        super.init(frame: .zero)
        self.vm = vm
        backgroundColor = AppearanceManager.sharedInstance.currentTheme.background
        
        // buttons
        pickBottleBtn = UIButton()
        throwBottleBtn = UIButton()
        btnsStackV = UIStackView(arrangedSubviews: [pickBottleBtn, throwBottleBtn])
        self.addSubview(btnsStackV)
        
        btnsStackV.axis = .horizontal
        btnsStackV.spacing = 80
        btnsStackV.snp.makeConstraints { make in
            make.bottom.equalTo(self.snp.bottom).offset(-64)
            make.centerX.equalTo(self.snp.centerX)
        }
        
        pickBottleBtn.backgroundColor = .brown
        pickBottleBtn.layer.cornerRadius = 40
        pickBottleBtn.setTitle("Pick", for: .normal)
        pickBottleBtn.addTarget(self, action: #selector(pickBottleBtnClicked), for: .touchUpInside)
        pickBottleBtn.snp.makeConstraints { make in
            make.height.equalTo(80)
            make.width.equalTo(80)
        }
        
        throwBottleBtn.frame = .init(x: 0, y: 0, width: 80, height: 80)
        throwBottleBtn.backgroundColor = .cyan
        throwBottleBtn.layer.cornerRadius = 40
        throwBottleBtn.setTitle("Throw", for: .normal)
        throwBottleBtn.addTarget(self, action: #selector(throwBottleBtnClicked), for: .touchUpInside)
        throwBottleBtn.snp.makeConstraints { make in
            make.height.equalTo(80)
            make.width.equalTo(80)
        }
        
        // sea
        bottleSeaV = BottleSeaView(vm: vm)
        self.addSubview(bottleSeaV)
        bottleSeaV.layer.zPosition = btnsStackV.layer.zPosition - 1
        bottleSeaV.snp.makeConstraints { make in
            make.bottomMargin.equalTo(0)
            make.leadingMargin.equalTo(0)
            make.trailingMargin.equalTo(0)
            make.topMargin.equalTo(0)
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
}
