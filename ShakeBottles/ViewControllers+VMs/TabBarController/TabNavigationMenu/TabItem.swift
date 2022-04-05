//
// Created by Sines on 3/25/22.
//

import Foundation
import UIKit

enum TabItem: String, CaseIterable {
    case shake = "Shake"
    case bottles = "Bottles"
    case me = "Me"

    var coordinator: Coordinator {
        switch self {
        case .shake:
            return ShakeCoordinator()
        case .bottles:
            return BottlesCoordinator()
        case .me:
            return MeCoordinator()
        }
    }
    
//    var viewController: UIViewController {
//        switch self {
//        case .shake:
//            return ShakeNavigationController()
//        case .bottles:
//            return BottlesNavigationController()
//        case .me:
//            return MeNavigationController()
//        }
//    }

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
