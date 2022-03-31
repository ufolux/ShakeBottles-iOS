//
//  BottlesViewController.swift
//  ShakeBottles
//
//  Created by Sines on 3/28/22.
//

import Foundation
import UIKit

class BottlesViewController: BaseViewController {
    private let vm = BottlesVM()
    
    override func loadView() {
        view = BottlesView(vm: vm)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let editBtn = UIBarButtonItem(title: "Messages", style: .plain, target: self, action: #selector(messageBtnClicked))
        self.navigationItem.rightBarButtonItem = editBtn
        self.navigationItem.title = "Bottles"
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    @objc func messageBtnClicked() {
        print("messages")
    }
}
