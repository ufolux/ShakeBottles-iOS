//
//  DeepLinkBaseCoordinator.swift
//  ShakeBottles
//
//  Created by Sines on 4/5/22.
//

import Foundation

protocol DeepLinkBaseCoordinator: FlowCoordinator {
    func handleDeeplink(deepLink: String)
}
