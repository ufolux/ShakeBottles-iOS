//
// Created by Sines on 4/6/22.
//

import UIKit
import SnapKit

class UniChatView: BaseView {
    var vm: UniChatVM!
    var tableView: UITableView!
    var tvDelegate: UniChatTableViewDelegate!
    
    init(vm: UniChatVM) {
        super.init(frame: .zero)
        self.vm = vm

        // Init UI
        tvDelegate = UniChatTableViewDelegate(vm: vm)
        tableView = UITableView(frame: .zero, style: .plain)
        tableView.backgroundColor = .blue
        tableView.delegate = tvDelegate
        tableView.dataSource = tvDelegate
        tableView.register(UniChatTextTableViewCell.self, forCellReuseIdentifier: UniChatTextTableViewCell.reuseIdentifier)
        tableView.register(UniChatImageTableViewCell.self, forCellReuseIdentifier: UniChatImageTableViewCell.reuseIdentifier)
        tableView.separatorStyle = .none
        addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.leading.equalTo(self.snp.leading)
            make.trailing.equalTo(self.snp.trailing)
            make.topMargin.equalTo(0)
            make.bottomMargin.equalTo(0)
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
