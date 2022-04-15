//
//  BaseNavigationController.swift
//  ShakeBottles
//
//  Created by Sines on 4/14/22.
//

import Foundation
import UIKit

class BaseNavigationController: UINavigationController {
    init() {
        super.init(nibName: nil, bundle: nil)
        let barAppearance = UINavigationBarAppearance()
        barAppearance.backgroundColor = AppearanceManager.shared.colors.background
        barAppearance.shadowColor = AppearanceManager.shared.colors.inputBg
        navigationBar.scrollEdgeAppearance = barAppearance
        navigationBar.standardAppearance = barAppearance
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        super.pushViewController(viewController, animated: animated)
    }
}
