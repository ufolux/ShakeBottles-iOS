//
//  Coordinator.swift
//  ShakeBottles
//
//  Created by Sines on 4/3/22.
//

import UIKit

enum AppFlow {
    case shake(ShakeScreen)
    case bottle(BottlesScreen)
    case me(MeScreen)
}

enum ShakeScreen {
    case shake
    case history
}

enum BottlesScreen {
    case bottle
    case messages
}

enum MeScreen {
    case me
    case editProfile
    case appearance
    case language
    case dataAndStorage
    case credit
    case about
}

protocol FlowCoordinator: AnyObject {
    var parentCoordinator: MainBaseCoordinator? { get set }
}

protocol Coordinator: FlowCoordinator {
    var rootViewController: BaseNavigationController { get set }
    func start() -> UIViewController
    func moveTo(flow: AppFlow, userData: [String: Any]?)
    @discardableResult func resetToRoot(animated: Bool) -> Self
}

extension Coordinator {
    var navigationRootViewController: BaseNavigationController? {
        get {
            rootViewController
        }
    }

    @discardableResult func resetToRoot(animated: Bool = true) -> Self {
        navigationRootViewController?.popToRootViewController(animated: animated)
        return self
    }
    
    func push(viewController: UIViewController, animated: Bool = true) {
        navigationRootViewController?.pushViewController(viewController, animated: animated)
    }
}
