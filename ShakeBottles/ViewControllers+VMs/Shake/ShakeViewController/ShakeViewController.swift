//
// Created by Sines on 3/25/22.
//

import Foundation
import UIKit
import CoreMotion
import AVFoundation

class ShakeViewController: BaseViewController, AVAudioPlayerDelegate {
    private let vm: ShakeVM = ShakeVM()
    private let motionManager = CMMotionManager()
    
    override func loadView() {
        view = ShakeView(vm: vm)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let editBtn = UIBarButtonItem(title: "History", style: .plain, target: self, action: #selector(historyBtnClicked))
        self.navigationItem.rightBarButtonItem = editBtn
        self.navigationItem.title = "Shake"
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        UIApplication.shared.applicationSupportsShakeToEdit = true
//        motionManager.startDeviceMotionUpdates()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
//        UIApplication.shared.applicationSupportsShakeToEdit = false
//        motionManager.stopDeviceMotionUpdates()
    }
    
    // MARK: - actions
    @objc func historyBtnClicked() {
        print("history")
    }
}
