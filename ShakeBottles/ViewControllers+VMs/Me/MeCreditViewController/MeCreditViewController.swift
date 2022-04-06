//
// Created by Sines on 4/5/22.
//

import UIKit

class MeCreditViewController: BaseViewController, MeBaseCoordinated {
    var coordinator: MeBaseCoordinator?

    init(coordinator: MeBaseCoordinator) {
        super.init(nibName: nil, bundle: nil)
        self.coordinator = coordinator
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

