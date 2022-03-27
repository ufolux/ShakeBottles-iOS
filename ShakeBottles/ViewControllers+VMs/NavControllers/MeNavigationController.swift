//
//  MeNavigationController.swift
//  ShakeBottles
//
//  Created by Sines on 3/25/22.
//

import Foundation
import UIKit

class MeNavigationController: UINavigationController {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)
        let textAttr = [NSAttributedString.Key.foregroundColor:UIColor.black]
        self.navigationBar.titleTextAttributes = textAttr
    }
    
    override func viewWillAppear(_ animated: Bool) {
        view.backgroundColor = .gray
    }
}
