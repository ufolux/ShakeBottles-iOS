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
        let vc = BottlesViewController(coordinator: self)
        nvc.pushViewController(vc, animated: false)
        rootViewController = nvc
        return rootViewController
    }
    
    func moveTo(flow: AppFlow, userData: [String : Any]?) {
        switch flow {
        case .bottle(let bottlesScreen):
            handleBottlesFlow(for: bottlesScreen, userData: nil)
        default:
            parentCoordinator?.moveTo(flow: flow, userData: nil)
        }
    }
    
    private func handleBottlesFlow(for screen: BottlesScreen, userData: [String: Any]?) {
        switch screen {
        case .bottle:
            resetToRoot()
        case .message:
            go2BottlesMessages()
        }
    }
    
    
    // MARK: - routers
    private func go2BottlesMessages() {
        let vc = BottlesMessagesViewController(coordinator: self)
        push(viewController: vc)
    }
}
