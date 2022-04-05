//
//  MeNavigationController.swift
//  ShakeBottles
//
//  Created by Sines on 3/25/22.
//

import Foundation
import UIKit

class MeNavigationController: UINavigationController {
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        view.backgroundColor = .gray
    }
}
