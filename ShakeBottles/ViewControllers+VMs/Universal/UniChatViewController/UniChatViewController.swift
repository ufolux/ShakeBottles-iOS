//
// Created by Sines on 4/6/22.
//

import UIKit
import RxSwift
import RxCocoa

class UniChatViewController: BaseViewController {
    let vm: UniChatVM = UniChatVM()
    var keyboardObserver: Disposable!
    
    override func loadView() {
        view = UniChatView(vm: vm)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = vm.title
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        keyboardObserver = Observable.from([
            NotificationCenter.default.rx.notification(UIResponder.keyboardWillShowNotification)
                .map { notification -> CGFloat in
                    guard let keyboardValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return 0}
                    return keyboardValue.cgRectValue.height
                },
            NotificationCenter.default.rx.notification(UIResponder.keyboardWillHideNotification)
                .map { _ in 0 }
        ])
        .merge()
        .subscribe(onNext: {[weak self] keyboardHeight in
            (self!.view as! UniChatView).transformView(keyboardHeight: keyboardHeight)
        })
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        keyboardObserver.dispose()
    }
}
