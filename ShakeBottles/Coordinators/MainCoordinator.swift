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
    
//    lazy var shakeCoordinator: ShakeCoordinator = TabItem.shake.coordinator as! ShakeCoordinator
//    lazy var bottlesCoordinator: BottlesCoordinator = TabItem.bottles.coordinator as! BottlesCoordinator
//    lazy var meCoordinator: MeCoordinator = TabItem.me.coordinator as! MeCoordinator
    lazy var deepLinkCoordinator: DeepLinkBaseCoordinator = DeepLinkCoordinator(mainBaseCoordinator: self)
    
    lazy var rootViewController: BaseNavigationController  = BaseNavigationController()
    
    func start() -> UIViewController {
//        shakeCoordinator.parentCoordinator = self
//        bottlesCoordinator.parentCoordinator = self
//        meCoordinator.parentCoordinator = self
        let navCtrl = rootViewController
        navCtrl.navigationBar.isHidden = false
        navCtrl.pushViewController(MainTabBarController(coordinator: self), animated: false)
        return rootViewController
    }
        
    func moveTo(flow: AppFlow, userData: [String : Any]?) {
        switch flow {
        case .shake(let shakeScreen):
            handleShakeFlow(for: shakeScreen, userData: userData)
        case .bottle(let bottlesScreen):
            handleBottlesFlow(for: bottlesScreen, userData: userData)
        case .me(let meScreen):
            handleMeFlow(for: meScreen, userData: userData)
        }
    }
    
    // MARK: - Bottles Flow
    private func handleBottlesFlow(for screen: BottlesScreen, userData: [String: Any]?) {
        switch screen {
        case .bottle:
            toBottle()
        case .messages:
            toMessages()
        }
    }
    
    private func toBottle() {
        resetToRoot()
        let tabCtrl = rootViewController.topViewController as! MainTabBarController
        tabCtrl.selectedIndex = 1
    }
    
    private func toMessages() {
        let vc = UniChatViewController()
        push(viewController: vc, animated: true)
    }
    
    
    // MARK: - Shake Flow
    private func handleShakeFlow(for screen: ShakeScreen, userData: [String: Any]?) {
        switch screen {
        case .shake:
            toShake()
        case .history:
            toShakeHistory()
        }
    }
    
    private func toShake() {
        resetToRoot()
        let tabCtrl = rootViewController.topViewController as! MainTabBarController
        tabCtrl.selectedIndex = 0
    }

    private func toShakeHistory() {
        let vc = ShakeHistoryViewController(coordinator: self)
        push(viewController: vc)
    }
    
    // MARK: - Me Flow
    private func handleMeFlow(for screen: MeScreen, userData: [String: Any]?) {
        
    }
    
    // MARK: - Deep Link
    func handleDeepLink(text: String) {
        deepLinkCoordinator.handleDeeplink(deepLink: text)
    }
}
