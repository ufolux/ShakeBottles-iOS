//
//  MeCoordinator.swift
//  ShakeBottles
//
//  Created by Sines on 4/3/22.
//

import UIKit

class MeCoordinator: MeBaseCoordinator {
    
    var parentCoordinator: MainBaseCoordinator?
    lazy var rootViewController: UIViewController = UIViewController()
    
    func start() -> UIViewController {
        let nvc = MeNavigationController()
        let vc = MeViewController(coordinator: self)
        nvc.pushViewController(vc, animated: false)
        rootViewController = nvc
        return rootViewController
    }
    
    func moveTo(flow: AppFlow, userData: [String : Any]?) {
        
    }
}
