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
        super.init(coder: aDecoder)
    }
    
    override init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        view.backgroundColor = .gray
    }
}
