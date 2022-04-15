//
// Created by Sines on 3/25/22.
//

import Foundation
import UIKit

enum TabItem: String, CaseIterable {
    case shake = "Shake"
    case bottles = "Bottles"
    case me = "Me"

//    var coordinator: Coordinator {
//        switch self {
//        case .shake:
//            return ShakeCoordinator()
//        case .bottles:
//            return BottlesCoordinator()
//        case .me:
//            return MeCoordinator()
//        }
//    }
    
    var viewController: ((_ coordinator: MainCoordinator)->UIViewController) {
        switch self {
        case .shake:
            return { (coordinator: MainCoordinator) -> UIViewController in
                let viewController = ShakeViewController(coordinator: coordinator)
                return viewController
            }
        case .bottles:
            return { (coordinator: MainCoordinator) -> UIViewController in
                let viewController = BottlesViewController(coordinator: coordinator)
                return viewController
            }
        case .me:
            return { (coordinator: MainCoordinator) -> UIViewController in
                let viewController = MeViewController(coordinator: coordinator)
                return viewController
            }
        }
    }

    var icon: UIImage? {
        switch self {
        case .shake:
            return UIImage(named: "ShakeIcon")!
        case .bottles:
            return UIImage(named: "BottleIcon")!
        case .me:
            return UIImage(named: "MeIcon")!
        }
    }

    var displayTitle: String {
        self.rawValue.capitalized(with: nil)
    }
}
