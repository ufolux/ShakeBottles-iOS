//
//  BottlesMessagesViewController.swift
//  ShakeBottles
//
//  Created by Sines on 4/5/22.
//

import UIKit

class BottlesMessagesViewController: BaseViewController, BottlesBaseCoordinated {
    var coordinator: BottlesBaseCoordinator?
    
    init(coordinator: BottlesBaseCoordinator) {
        super.init(nibName: nil, bundle: nil)
        self.coordinator = coordinator
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
