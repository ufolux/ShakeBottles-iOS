//
// Created by Sines on 3/25/22.
//

import Foundation
import UIKit

enum TabItem: String, CaseIterable {
    case shake = "Shake"
    case bottles = "Bottles"
    case me = "Me"

    var viewController: UIViewController {
        switch self {
        case .shake:
            return ShakeNavigationController(rootViewController: ShakeViewController())
        case .bottles:
            return BottlesNavigationController(rootViewController: BottlesViewController())
        case .me:
            return MeNavigationController(rootViewController: MeViewController())
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
