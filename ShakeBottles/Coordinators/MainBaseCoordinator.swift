//
//  MainBaseCoordinator.swift
//  ShakeBottles
//
//  Created by Sines on 4/5/22.
//

import Foundation

protocol MainBaseCoordinator: Coordinator {
//    var shakeCoordinator: ShakeCoordinator { get }
//    var bottlesCoordinator: BottlesCoordinator { get }
//    var meCoordinator: MeCoordinator { get }
    var deepLinkCoordinator: DeepLinkBaseCoordinator { get }
}

protocol MainBaseCoordinated {
    var coordinator: MainCoordinator? { get }
}

protocol ShakeBaseCoordinated {
    var coordinator: ShakeBaseCoordinator? { get }
}

protocol BottlesBaseCoordinated {
    var coordinator: BottlesBaseCoordinator? { get }
}

protocol MeBaseCoordinated {
    var coordinator: MeBaseCoordinator? { get }
}
