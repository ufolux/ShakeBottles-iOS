//
//  MeView.swift
//  ShakeBottles
//
//  Created by Sines on 3/26/22.
//

import Foundation
import UIKit
import SnapKit

final class MeView: BaseScrollView, UITableViewDelegate {
    private var tableView: UITableView!
    private var avatarTopView: AvatarTopView!
    private var tvDelegate: MeTableViewDelegate!
    private var vm: MeVM!
    
    init(vm: MeVM) {
        super.init(frame: .zero)
        self.vm = vm
        backgroundColor = AppearanceManager.shared.colors.background
        
        // avatar top view
        avatarTopView = AvatarTopView(vm: vm)
        addSubview(avatarTopView)
        avatarTopView.snp.makeConstraints { make in
            make.topMargin.equalTo(UIUtil.navigationBarHeight)
            make.leading.equalTo(snp.leading)
            make.trailing.equalTo(snp.trailing)
            make.height.equalTo(200)
        }
        
        // init table view and constraints
        tableView = UITableView()
        tableView.isScrollEnabled = false
        tableView.backgroundColor = .clear
        tvDelegate = MeTableViewDelegate(vm: vm)
        tableView.dataSource = tvDelegate
        tableView.delegate = tvDelegate
        addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.leading.equalTo(snp.leading)
            make.trailing.equalTo(snp.trailing)
            make.top.equalTo(avatarTopView.snp.bottom).offset(8)
            make.bottom.equalTo(snp.bottom)
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
