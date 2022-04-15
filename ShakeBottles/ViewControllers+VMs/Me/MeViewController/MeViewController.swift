//
// Created by Sines on 3/25/22.
//

import Foundation
import UIKit
import SnapKit

final class MeViewController: BaseViewController  {
    private let vm = MeVM()

    init(coordinator: MainCoordinator) {
        super.init(nibName: nil, bundle: nil)
        vm.coordinator = coordinator
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = MeView(vm: vm)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let editBtn = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(editBtnClicked))
        navigationItem.rightBarButtonItem = editBtn
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    @objc func editBtnClicked() {
        vm.coordinator?.moveTo(flow: .me(.editProfile), userData: nil)
    }
}
