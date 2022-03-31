//
//  ShakeView.swift
//  ShakeBottles
//
//  Created by Sines on 3/28/22.
//

import Foundation
import UIKit
import SnapKit
import AVFAudio

class ShakeView: BaseView, AVAudioPlayerDelegate {
    private var vm: ShakeVM!
    private let shakeImgVLeft = UIImageView()
    private let shakeImgVRight = UIImageView()
    private let shakeSoundPath = Bundle.main.path(forResource: "ShakeKacha", ofType: "mp3")!
    private var shakeSoundData: Data!
    private var player: AVAudioPlayer?
    
    init(vm: ShakeVM) {
        super.init(frame: .zero)
        self.vm = vm
        self.backgroundColor = AppearanceManager.sharedInstance.currentTheme.background
        
        self.addSubview(shakeImgVLeft)
        shakeImgVLeft.image = UIImage(named: "shakeIconLeft")
        shakeImgVLeft.snp.makeConstraints { make in
            make.height.equalTo(100)
            make.width.equalTo(50)
            make.centerX.equalTo(self.snp.centerX).offset(-50/2)
            make.centerY.equalTo(self.snp.centerY).offset(-64)
        }
        self.addSubview(shakeImgVRight)
        shakeImgVRight.image = UIImage(named: "shakeIconRight")
        shakeImgVRight.snp.makeConstraints { make in
            make.height.equalTo(100)
            make.width.equalTo(50)
            make.centerX.equalTo(self.snp.centerX).offset(50/2)
            make.centerY.equalTo(self.snp.centerY).offset(-64)
        }
        
        let instruction = UILabel()
        self.addSubview(instruction)
        instruction.text = "Meet someone who shakes the phone at the same time with you!"
        instruction.numberOfLines = 0
        instruction.textAlignment = .center
        instruction.font = .italicSystemFont(ofSize: 16)
        instruction.textColor = .gray
        instruction.snp.makeConstraints { make in
            make.centerX.equalTo(self.snp.centerX)
            make.top.equalTo(shakeImgVLeft.snp.bottom).offset(8)
            make.leading.equalTo(self.snp.leading).offset(32)
            make.trailing.equalTo(self.snp.trailing).offset(-32)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - motion detection
    override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if event?.subtype == .motionShake {
            UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseIn) {
                self.shakeImgVLeft.frame.origin.x -= 16
                self.shakeImgVRight.frame.origin.x += 16
            }
            
            playShakeSound()
            
            UIView.animate(withDuration: 0.3, delay: 0.7, options: .curveEaseIn) {
                self.shakeImgVLeft.frame.origin.x += 16
                self.shakeImgVRight.frame.origin.x -= 16
            }
        }
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if event?.subtype == .motionShake {
            
        }
    }
    
    override func motionCancelled(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if event?.subtype == .motionShake {
            
        }
    }
    
    func playShakeSound() {
        // init player and sound
        if shakeSoundData == nil {
            shakeSoundData = try? Data(contentsOf: URL(fileURLWithPath: shakeSoundPath))
        }
        
        if shakeSoundData != nil {
            if player == nil {
                player = try? AVAudioPlayer(data: shakeSoundData)
                player?.delegate = self
                player?.updateMeters()
                player?.prepareToPlay()
            }
            if player != nil {
                player?.play()
            }
        }
    }
}
