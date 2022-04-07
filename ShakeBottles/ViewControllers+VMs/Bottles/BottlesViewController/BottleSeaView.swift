//
//  BottleSeaView.swift
//  ShakeBottles
//
//  Created by Sines on 3/31/22.
//

import Foundation
import UIKit

class BottleSeaView: BaseView, CAAnimationDelegate {
    private var vm: BottlesVM!
    private var waves: [UIView] = []
    private var clouds: [UIView] = []
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(vm: BottlesVM) {
        super.init(frame: .zero)
        self.vm = vm
        clipsToBounds = true
        backgroundColor = AppearanceManager.shared.currentThemeColors.background
        
        // init waves
        for i in 0..<4 {
            let picName = "Wave\(i)"
            let waveImgV = UIView()
            waveImgV.layer.contents = UIImage(named: picName)?.cgImage
            addSubview(waveImgV)
            waveImgV.contentMode = .scaleAspectFill
            waveImgV.snp.makeConstraints { make in
                make.width.equalTo(600)
                make.height.equalTo(100)
                make.centerX.equalTo(self.snp.centerX)
                make.bottom.equalTo(self.snp.bottom).offset(-i*45)
            }
            waveImgV.layer.zPosition = Double(-i)
            waves.append(waveImgV)
        }
        
        for i in 0..<3 {
            let picName = "Cloud\(i)"
            let cloudImgV = UIView()
            cloudImgV.layer.contents = UIImage(named: picName)?.cgImage
            addSubview(cloudImgV)
            cloudImgV.contentMode = .scaleAspectFill
            cloudImgV.snp.makeConstraints { make in
                make.width.equalTo(100)
                make.height.equalTo(60)
                make.left.equalTo(self.snp.right).offset(16)
                make.bottom.equalTo(waves[3].snp.top).offset(-240 + (i % 2 == 0 ? 10 : -10))
            }
            clouds.append(cloudImgV)
        }
        initCloudAnimation()
        startSeaAnimation()
    }
    
    func initCloudAnimation() {
        for (i, cloud) in clouds.enumerated() {
            startCloudAnimation(cloud, initDelay: Double(i * 2))
        }
    }
    
    func startCloudAnimation(_ cloud: UIView, initDelay: Double = 0) {
        CATransaction.begin()
        CATransaction.setCompletionBlock {
            self.startCloudAnimation(cloud)
        }
        let animationX = CABasicAnimation()
        animationX.keyPath = "transform.translation.x"
        animationX.isRemovedOnCompletion = true
        animationX.repeatCount = 1
        animationX.duration = 10
        animationX.beginTime = initDelay != .zero ? CACurrentMediaTime() + initDelay : CACurrentMediaTime() + Double.random(in: 2...10)
        animationX.byValue = -UIUtil.screenWidth - 100.0 - 16
        animationX.delegate = self
        cloud.layer.add(animationX, forKey: nil)
        CATransaction.commit()
    }
    
    
    func startSeaAnimation() {
        for (i, wave) in waves.enumerated() {
            let animationX = CABasicAnimation()
            animationX.keyPath = "transform.translation.x"
            animationX.isRemovedOnCompletion = false
            animationX.autoreverses = true
            animationX.repeatCount = .infinity
            animationX.duration = 2
            animationX.byValue = i % 2 == 0 ? Double((i+1)*15) : -Double((i+1)*15)
            animationX.fillMode = .forwards
            
            let animationY = CABasicAnimation()
            animationY.keyPath = "transform.translation.y"
            animationY.isRemovedOnCompletion = false
            animationY.autoreverses = true
            animationY.repeatCount = 1
            animationY.duration = 2
            animationY.byValue = i % 2 == 0 ? Double(i*3) : -Double(i*5)
            animationY.fillMode = .forwards
            
            wave.layer.add(animationX, forKey: nil)
            wave.layer.add(animationY, forKey: nil)
        }
    }
    
    
    // MARK: - Animation Delegate

}
