//
//  MainTabBarController.swift
//  ShakeBottles
//
//  Created by Sines on 3/25/22.
//

import Foundation
import UIKit
import SnapKit

class MainTabBarController: BaseTabBarController {
    var customTabBar: TabNavigationMenu!
    var tabBarHeight: CGFloat = 67.0 + UIApplication.shared.windows.first!.safeAreaInsets.bottom


    override func viewDidLoad() {
        super.viewDidLoad()
        loadTabBar()
        delegate = self
    }

    private func loadTabBar() {
        let tabItems: [TabItem] = [.shake, .bottles, .me]
        setupCustomTabBar(tabItems) { (controllers) in
            self.viewControllers = controllers
        }
        // default selected
        selectedIndex = 1
    }

    private func setupCustomTabBar(_ items: [TabItem], completion: @escaping ([UIViewController]) -> Void) {
        let frame = tabBar.frame
        var controllers = [UIViewController]()

        // hide the tab bar
        tabBar.isHidden = true

        customTabBar = TabNavigationMenu(menuItems: items, frame: frame)
        customTabBar.backgroundColor = UIColor.white
        customTabBar.translatesAutoresizingMaskIntoConstraints = false
        customTabBar.clipsToBounds = true
        customTabBar.itemTapped = changeTab

        // Add it to the view
        view.addSubview(customTabBar)

        // Add position constraints to place the nav menu right where the tab bar should be
        customTabBar.snp.makeConstraints { make in
            make.leading.equalTo(view.snp.leading)
            make.trailing.equalTo(view.snp.trailing)
            make.bottom.equalTo(view.snp.bottom)
            make.width.equalTo(tabBar.frame.width)
            make.height.equalTo(tabBarHeight)
        }

        for i in 0..<items.count {
            controllers.append(items[i].viewController)
        }
        view.layoutIfNeeded()
        completion(controllers)
    }

    func changeTab(tab: Int) {
        selectedIndex = tab
    }

}

extension MainTabBarController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, animationControllerForTransitionFrom fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        MyTransition(viewControllers: tabBarController.viewControllers)
    }
}

class MyTransition: NSObject, UIViewControllerAnimatedTransitioning {

    let viewControllers: [UIViewController]?
    let transitionDuration: Double = 0.25

    init(viewControllers: [UIViewController]?) {
        self.viewControllers = viewControllers
    }

    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        TimeInterval(transitionDuration)
    }

    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard
            let fromVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from),
            let fromView = fromVC.view,
            let fromIndex = getIndex(forViewController: fromVC),
            let toVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to),
            let toView = toVC.view,
            let toIndex = getIndex(forViewController: toVC)
            else {
                transitionContext.completeTransition(false)
                return
        }

        let frame = transitionContext.initialFrame(for: fromVC)
        var fromFrameEnd = frame
        var toFrameStart = frame
        fromFrameEnd.origin.x = toIndex > fromIndex ? frame.origin.x - frame.width : frame.origin.x + frame.width
        toFrameStart.origin.x = toIndex > fromIndex ? frame.origin.x + frame.width : frame.origin.x - frame.width
        toView.frame = toFrameStart

        DispatchQueue.main.async {
            transitionContext.containerView.addSubview(toView)
            UIView.animate(withDuration: self.transitionDuration, animations: {
                fromView.frame = fromFrameEnd
                toView.frame = frame
            }, completion: {success in
                fromView.removeFromSuperview()
                transitionContext.completeTransition(success)
            })
        }
    }

    func getIndex(forViewController vc: UIViewController) -> Int? {
        guard let vcs = viewControllers else { return nil }
        for (index, thisVC) in vcs.enumerated() {
            if thisVC == vc { return index }
        }
        return nil
    }
}
