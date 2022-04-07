//
// Created by Sines on 4/6/22.
//

import UIKit

class UniChatViewController: BaseViewController {
    let viewModel: UniChatVM = UniChatVM()

    override func loadView() {
        view = UniChatView(vm: viewModel)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
