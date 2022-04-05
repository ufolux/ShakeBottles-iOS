//
//  DeepLinkCoordinator.swift
//  ShakeBottles
//
//  Created by Sines on 4/5/22.
//

import Foundation

class DeepLinkCoordinator: DeepLinkBaseCoordinator {
    
    func handleDeeplink(deepLink: String) {
        print(deepLink)
    }
    
    var parentCoordinator: MainBaseCoordinator?
    
    init(mainBaseCoordinator: MainBaseCoordinator) {
        self.parentCoordinator = mainBaseCoordinator
    }
}
