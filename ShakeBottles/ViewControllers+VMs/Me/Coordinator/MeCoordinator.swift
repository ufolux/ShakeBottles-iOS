////
////  MeCoordinator.swift
////  ShakeBottles
////
////  Created by Sines on 4/3/22.
////
//
//import UIKit
//
//class MeCoordinator: MeBaseCoordinator {
//
//    var parentCoordinator: MainBaseCoordinator?
//    lazy var rootViewController: UIViewController = UIViewController()
//
//    func start() -> UIViewController {
//        let nvc = MeNavigationController()
////        let vc = MeViewController(coordinator: )
////        nvc.pushViewController(vc, animated: false)
//        rootViewController = nvc
//        return rootViewController
//    }
//
//    func moveTo(flow: AppFlow, userData: [String : Any]?) {
//        switch flow {
//        case .me(let meScreen):
//            handleMeFlow(screen: meScreen, userData: nil)
//        default:
//            parentCoordinator?.moveTo(flow: flow, userData: nil)
//        }
//    }
//
//    private func handleMeFlow(screen: MeScreen, userData: [String : Any]?) {
//        switch screen {
//        case .me:
//            resetToRoot()
//        case .editProfile:
//            go2EditProfile()
//        case .appearance:
//            go2Appearance()
//        case .language:
//            go2Language()
//        case .dataAndStorage:
//            go2DataAndStorage()
//        case .credit:
//            go2Credit()
//        case .about:
//            go2About()
//        }
//    }
//
//    // MARK: - Go to Pages
//    private func go2EditProfile() {
//        let vc = MeEditProfileViewController(coordinator: self)
//        push(viewController: vc)
//    }
//
//    private func go2Appearance() {
//        let vc = MeAppearanceViewController(coordinator: self)
//        push(viewController: vc)
//    }
//
//    private func go2Language() {
//        let vc = MeLanguageViewController(coordinator: self)
//        push(viewController: vc)
//    }
//
//    private func go2DataAndStorage() {
//        let vc = MeDataAndStorageViewController(coordinator: self)
//        push(viewController: vc)
//    }
//
//    private func go2Credit() {
//        let vc = MeCreditViewController(coordinator: self)
//        push(viewController: vc)
//    }
//
//    private func go2About() {
//        let vc = MeAboutViewController(coordinator: self)
//        push(viewController: vc)
//    }
//}
