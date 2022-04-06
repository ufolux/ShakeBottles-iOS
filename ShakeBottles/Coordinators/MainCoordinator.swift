//
//  MainCoordinator.swift
//  ShakeBottles
//
//  Created by Sines on 4/5/22.
//

import UIKit

class MainCoordinator: MainBaseCoordinator {
    // TabBarController Coordinator
    var parentCoordinator: MainBaseCoordinator?
    
    lazy var shakeCoordinator: ShakeCoordinator = TabItem.shake.coordinator as! ShakeCoordinator
    lazy var bottlesCoordinator: BottlesCoordinator = TabItem.bottles.coordinator as! BottlesCoordinator
    lazy var meCoordinator: MeCoordinator = TabItem.me.coordinator as! MeCoordinator
    lazy var deepLinkCoordinator: DeepLinkBaseCoordinator = DeepLinkCoordinator(mainBaseCoordinator: self)
    
    lazy var rootViewController: UIViewController  = MainTabBarController()
    
    func start() -> UIViewController {
        shakeCoordinator.parentCoordinator = self
        bottlesCoordinator.parentCoordinator = self
        meCoordinator.parentCoordinator = self
        return rootViewController
    }
        
    func moveTo(flow: AppFlow, userData: [String : Any]?) {
        
    }
    
    func handleDeepLink(text: String) {
        deepLinkCoordinator.handleDeeplink(deepLink: text)
    }
}
