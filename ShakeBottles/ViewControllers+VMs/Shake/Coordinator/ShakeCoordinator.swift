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
        switch flow {
        case .shake(let shakeScreen):
            handleShakeFlow(for: shakeScreen, userData: userData)
        default:
            parentCoordinator?.moveTo(flow: flow, userData: userData)
        }
    }
    
    
    private func handleShakeFlow(for screen: ShakeScreen, userData: [String: Any]?) {
        switch screen {
        case .shake:
            navigationRootViewController?.popToRootViewController(animated: true)
        case .history:
            go2ShakeHistory()
        }
    }
    
    private func go2ShakeHistory() {
        let vc = ShakeHistoryViewController(coordinator: self)
        push(viewController: vc)
    }
}
