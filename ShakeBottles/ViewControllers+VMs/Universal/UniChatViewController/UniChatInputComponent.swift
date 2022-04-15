//
//  UniChatInputView.swift
//  ShakeBottles
//
//  Created by Sines on 4/14/22.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

class UniChatInputComponent: BaseView, UITextFieldDelegate {
    private var vm: UniChatVM!
    private var textField: UITextField!
    private var sendButton: UIButton!
    private var emojiButton: UIButton!
    private var moreButton: UIButton!
    private var talkButton: UIButton!
    
    let disposeBag = DisposeBag()
    
    init(vm: UniChatVM) {
        super.init(frame: .zero)
        self.vm = vm
        setupViews()
        setupObserver()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        let buttonSize = 53.0
        backgroundColor = AppearanceManager.shared.colors.inputBg
        
        moreButton = UIButton(type: .system)
        moreButton.setImage(UIImage(systemName: "ellipsis.circle")?
            .withTintColor(.lightGray, renderingMode: .alwaysOriginal), for: .normal)
        moreButton.addTarget(self, action: #selector(imageButtonClicked), for: .touchUpInside)
        moreButton.frame = CGRect(x: 0, y: 0, width: buttonSize, height: buttonSize)
        
        textField = UITextField(frame: .zero)
        textField.frame = CGRect(x: AppearanceManager.shared.sizes.marginL,
                                 y: 0,
                                 width: UIUtil.screenWidth - 2 * (buttonSize + AppearanceManager.shared.sizes.marginL),
                                 height: AppearanceManager.shared.sizes.inputHeight)
        textField.backgroundColor = .white
        textField.placeholder = "Message"
        textField.delegate = self
        
        let textContainer = UIView()
        textContainer.frame = CGRect(x: buttonSize,
                                     y: AppearanceManager.shared.sizes.marginM,
                                     width: UIUtil.screenWidth - 2 * buttonSize,
                                     height: AppearanceManager.shared.sizes.inputHeight)
        textContainer.backgroundColor = .white
        textContainer.clipsToBounds = true
        textContainer.layer.cornerRadius = AppearanceManager.shared.sizes.cornerRadiusL
        
        emojiButton = UIButton(type: .system)
        emojiButton.setImage(UIImage(systemName: "face.smiling")?
            .withTintColor(.lightGray, renderingMode: .alwaysOriginal), for: .normal)
        emojiButton.addTarget(self, action: #selector(emojiButtonClicked), for: .touchUpInside)
        emojiButton.frame = CGRect(x: textContainer.frame.width - AppearanceManager.shared.sizes.inputHeight, y: 0, width: AppearanceManager.shared.sizes.inputHeight, height: AppearanceManager.shared.sizes.inputHeight)
        
        textContainer.addSubview(textField)
        textContainer.addSubview(emojiButton)
        
        let rightBtnFrame = CGRect(x: UIUtil.screenWidth - buttonSize, y: 0, width: buttonSize, height: buttonSize)
        sendButton = UIButton(type: .system)
        sendButton.setImage(UIImage(systemName: "arrow.up.circle")?
            .withTintColor(.lightGray, renderingMode: .alwaysOriginal), for: .normal)
        sendButton.addTarget(self, action: #selector(sendButtonClicked), for: .touchUpInside)
        sendButton.isHidden = true
        sendButton.frame = rightBtnFrame
        
        
        talkButton = UIButton(type: .system)
        talkButton.setImage(UIImage(systemName: "mic.circle")?
            .withTintColor(.lightGray, renderingMode: .alwaysOriginal), for: .normal)
        talkButton.addTarget(self, action: #selector(talkButtonClicked), for: .touchUpInside)
        talkButton.frame = rightBtnFrame
        
        
        addSubview(sendButton)
        addSubview(talkButton)
        addSubview(textContainer)
        addSubview(moreButton)
    }
    
    private func setupObserver() {
        // hide emoji button
        textField.rx.text.orEmpty
            .scan([], accumulator: { pre, cur in
                return Array(pre + [cur]).suffix(2)
            })
            .subscribe(onNext: { [weak self] options in
                if options.first?.isEmpty != options.last?.isEmpty {
                    if options.last!.isEmpty {
                        UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseIn) {
                            self!.emojiButton.isHidden = false
                            self?.emojiButton.alpha = 1.0
                        }
                    } else {
                        UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseOut) {
                            self?.emojiButton.alpha = 0.0
                        } completion: { _ in
                            self!.emojiButton.isHidden = true
                        }
                    }
                }
            })
            .disposed(by: disposeBag)
    }
    
    @objc func sendButtonClicked() {
        // TODO:
    }
    
    @objc func emojiButtonClicked() {
        // TODO:
    }
    
    @objc func imageButtonClicked() {
        // TODO:
    }
    
    @objc func talkButtonClicked() {
        // TODO:
    }
    
    // MARK: - TextField Delegate
    
    
    @discardableResult public override func resignFirstResponder() -> Bool {
        textField.resignFirstResponder()
        return super.resignFirstResponder()
    }
        
}
