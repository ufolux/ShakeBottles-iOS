//
// Created by Sines on 3/25/22.
//

import Foundation
import UIKit
import SnapKit

final class MeViewController: UIViewController {
    let meVM = MeVM()
    
    override func loadView() {
        view = MeView(vm: meVM)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let editBtn = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(editBtnClicked))
        self.navigationItem.rightBarButtonItem = editBtn
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    @objc func editBtnClicked() {
        print("Btn Clicked")
    }
}
