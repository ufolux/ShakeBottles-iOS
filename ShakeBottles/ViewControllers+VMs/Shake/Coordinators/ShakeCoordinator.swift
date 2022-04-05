//
//  MainCoordinators.swift
//  ShakeBottles
//
//  Created by Sines on 4/3/22.
//

import Foundation
import UIKit

final class ShakeCoordinator: ShakeBaseCoordinator {
    var parentCoordinator: MainBaseCoordinator?
    lazy var rootViewController: UIViewController = UIViewController()
    
    func start() -> UIViewController {
        let nvc = ShakeNavigationController()
        let vc = ShakeViewController(coordinator: self)
        nvc.pushViewController(vc, animated: false)
        rootViewController = nvc
        return rootViewController
    }
    
    func moveTo(flow: AppFlow, userData: [String : Any]?) {
        
    }
    
    
}
