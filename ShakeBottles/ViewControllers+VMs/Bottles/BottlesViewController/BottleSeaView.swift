//
//  BottleSeaView.swift
//  ShakeBottles
//
//  Created by Sines on 3/31/22.
//

import Foundation
import UIKit

class BottleSeaView: BaseView {
    private var vm: BottlesVM!
    
    init(vm: BottlesVM) {
        super.init(frame: .zero)
        self.vm = vm
        backgroundColor = .link
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
