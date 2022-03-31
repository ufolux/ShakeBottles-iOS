//
//  MeSettingsCell.swift
//  ShakeBottles
//
//  Created by Sines on 3/27/22.
//

import Foundation
import UIKit

class MeSettingsCell: UITableViewCell {
    static let reuseIdentifierStr: String = "com.shakebottles.MeSettingsCell"
    init(cellModel: SettingsCellModel) {
        super.init(style: .default, reuseIdentifier: MeSettingsCell.reuseIdentifierStr)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
