//
// Created by Sines on 4/6/22.
//

import UIKit
import SnapKit

class UniChatView: BaseView {
    var vm: UniChatVM!
    var tableView: UITableView!
    var tvDelegate: UniChatTableViewDelegate!
    var inputComponent: UniChatInputComponent!
    var containerView: BaseView!
    
    init(vm: UniChatVM) {
        super.init(frame: .zero)
        self.vm = vm
        
        // Init UI
        tvDelegate = UniChatTableViewDelegate(vm: vm)
        tableView = UITableView(frame: .zero, style: .plain)
        tableView.contentInsetAdjustmentBehavior = .never
        tableView.delegate = tvDelegate
        tableView.dataSource = tvDelegate
        tableView.register(UniChatTextTableViewCell.self, forCellReuseIdentifier: UniChatTextTableViewCell.reuseIdentifier)
        tableView.register(UniChatImageTableViewCell.self, forCellReuseIdentifier: UniChatImageTableViewCell.reuseIdentifier)
        tableView.separatorStyle = .none
        
        inputComponent = UniChatInputComponent(vm: vm)
        
        
        containerView = BaseView()
        containerView.addSubview(inputComponent)
        containerView.addSubview(tableView)
        addSubview(containerView)
        
        inputComponent.snp.makeConstraints { make in
            make.leading.equalTo(self.snp.leading)
            make.trailing.equalTo(self.snp.trailing)
            make.bottomMargin.equalTo(0)
            make.height.equalTo(53 + UIUtil.bottomSafeAreaHeight)
        }
        tableView.snp.makeConstraints { make in
            make.leading.equalTo(self.snp.leading)
            make.trailing.equalTo(self.snp.trailing)
            make.topMargin.equalTo(AppearanceManager.shared.sizes.marginM)
            make.bottom.equalTo(inputComponent.snp.top)
        }
        
        containerView.snp.makeConstraints { make in
            make.topMargin.equalTo(0)
            make.bottomMargin.equalTo(-AppearanceManager.shared.sizes.marginM)
            make.width.equalTo(UIUtil.screenWidth)
            make.centerX.equalTo(UIUtil.screenWidth / 2.0)
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        inputComponent.resignFirstResponder()
        return super.hitTest(point, with: event)
    }
    
    // MARK: - Animations
    public func transformView(keyboardHeight: CGFloat) {
        // MARK: Article safeAreaInsets is 0,0,0,0 before viewSafeAreaInsetsDidChange called.
        let bottomMargin = -keyboardHeight + 2 * safeAreaInsets.bottom - AppearanceManager.shared.sizes.marginM
        containerView.snp.updateConstraints { make in
            make.topMargin.equalTo(-keyboardHeight)
            make.bottomMargin.equalTo(keyboardHeight > 0.0 ? bottomMargin : safeAreaInsets.bottom - AppearanceManager.shared.sizes.marginM)
        }
        needsUpdateConstraints()
        updateConstraintsIfNeeded()
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseIn) {
            self.layoutIfNeeded()
        }
    }
}
