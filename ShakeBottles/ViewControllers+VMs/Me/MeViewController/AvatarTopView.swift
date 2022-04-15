//
//  AvatarCell.swift
//  ShakeBottles
//
//  Created by Sines on 3/26/22.
//

import Foundation
import UIKit
import SnapKit

final class AvatarTopView: BaseView {
    // private
    private let placeholderAvatar: UIImage = #imageLiteral(resourceName: "MeIcon")
    private var avatarImgV: UIImageView!
    private var nameLbl: UILabel!
    private var phoneNumLbl: UILabel!
    private var dotLbl: UILabel!
    private var idLbl: UILabel!
    private var phoneIdContainer: UIStackView!
    
    private var vm: MeVM!
    
    // internal
    private var _avatarURL: String!
    var avatarURL: String {
        set {
            _avatarURL = newValue;
            let url: URL = URL(string: _avatarURL)!
            avatarImgV.loadImage(from: url, placeholder: placeholderAvatar)
        }
        get {
            _avatarURL
        }
    }
    var nameStr: String = "Richard Lu"
    var phoneNOStr: String = ""
    var idStr: String = ""
    
    init(vm: MeVM) {
        super.init(frame: .zero)
        self.vm = vm
        backgroundColor = .clear
        
        // avatar
        avatarImgV = UIImageView()
        avatarImgV.layer.cornerRadius = 44
        avatarImgV.layer.masksToBounds = true
        avatarImgV.image = placeholderAvatar
        avatarImgV.backgroundColor = UIColor(0x9bdefe)
        addSubview(avatarImgV)
        avatarImgV.snp.makeConstraints { make in
            make.centerX.equalTo(snp.centerX)
            make.width.equalTo(88)
            make.height.equalTo(88)
            make.topMargin.equalTo(0)
        }
        
        // labels
        nameLbl = UILabel()
        nameLbl.text = nameStr
        nameLbl.font = UIFont.boldSystemFont(ofSize: 28)
        addSubview(nameLbl)
        nameLbl.snp.makeConstraints { make in
            make.centerX.equalTo(snp.centerX)
            make.top.equalTo(avatarImgV.snp.bottom).offset(24)
        }
        
        phoneNumLbl = UILabel()
        dotLbl = UILabel()
        idLbl = UILabel()
        phoneIdContainer = UIStackView(arrangedSubviews: [phoneNumLbl, dotLbl, idLbl])
        phoneIdContainer.axis = .horizontal
        phoneIdContainer.spacing = 2
        addSubview(phoneIdContainer)
        phoneIdContainer.snp.makeConstraints { make in
            make.top.equalTo(nameLbl.snp.bottom)
            make.centerX.equalTo(snp.centerX)
            make.leading.equalTo(snp.leading).offset(32)
            make.trailing.equalTo(snp.trailing).offset(-32)
        }
        // TODO: Provide Data
        phoneNumLbl.text = "+8613827898989"
        phoneNumLbl.font.withSize(20)
        dotLbl.text = "·"
        dotLbl.font.withSize(20)
        idLbl.text = "@r1charjhui啊撒撒啊洒洒阿adasd123asadafasf"
        idLbl.font.withSize(20)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
