//
//  MeView.swift
//  ShakeBottles
//
//  Created by Sines on 3/26/22.
//

import Foundation
import UIKit
import SnapKit

final class MeView: BaseView, UITableViewDelegate {
    private var tableView: UITableView!
    private var avatarTopView: AvatarTopView!
    private var tvDelegate: MeTableViewDelegate!
    private var vm: MeVM!
    
    init(vm: MeVM) {
        super.init(frame: .zero)
        self.vm = vm
        self.backgroundColor = AppearanceManager.sharedInstance.currentTheme.background
        
        // avatar top view
        avatarTopView = AvatarTopView(vm: vm)
        self.addSubview(avatarTopView)
        avatarTopView.snp.makeConstraints { make in
            make.topMargin.equalTo(0)
            make.leading.equalTo(self.snp.leading)
            make.trailing.equalTo(self.snp.trailing)
            make.height.equalTo(250)
        }
        
        // init table view and constraints
        tableView = UITableView()
        tableView.backgroundColor = .clear
        tvDelegate = MeTableViewDelegate(vm: vm)
        tableView.dataSource = tvDelegate
        tableView.delegate = tvDelegate
        self.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.leading.equalTo(self.snp.leading)
            make.trailing.equalTo(self.snp.trailing)
            make.top.equalTo(avatarTopView.snp.bottom).offset(8)
            make.bottom.equalTo(self.snp.bottom)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
