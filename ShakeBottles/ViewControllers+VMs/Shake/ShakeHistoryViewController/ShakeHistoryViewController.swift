//
//  ShakeHistoryViewController.swift
//  ShakeBottles
//
//  Created by Sines on 4/5/22.
//

import UIKit

class ShakeHistoryViewController: BaseViewController, MainBaseCoordinated {
    var coordinator: MainCoordinator?
    
    init(coordinator: MainCoordinator) {
        super.init(nibName: nil, bundle: nil)
        self.coordinator = coordinator
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
