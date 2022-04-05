//
//  BottlesCoordinator.swift
//  ShakeBottles
//
//  Created by Sines on 4/3/22.
//

import Foundation
import UIKit

class BottlesCoordinator: BottlesBaseCoordinator {
    var parentCoordinator: MainBaseCoordinator?
    
    lazy var rootViewController: UIViewController = UIViewController()
    
    func start() -> UIViewController {
        let nvc = BottlesNavigationController()
        let vc = BottlesViewController()
        nvc.pushViewController(vc, animated: false)
        rootViewController = nvc
        return rootViewController
    }
    
    func moveTo(flow: AppFlow, userData: [String : Any]?) {
        
    }
}
