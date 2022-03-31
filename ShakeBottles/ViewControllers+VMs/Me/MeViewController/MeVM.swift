//
//  MeVM.swift
//  ShakeBottles
//
//  Created by Sines on 3/26/22.
//

import Foundation
import RxSwift
import RxCocoa
import RxDataSources
import SwiftIconFont

struct SettingsCellModel {
    var icon: String
    var title: String
    var color: UIColor
    var rightText: String = ""
}

final class MeVM: BaseViewModel {
    let settingsTableViewArray: Array<SettingsCellModel> = [
        SettingsCellModel(icon: "palette", title: "Appearance", color: UIColor(rgb: 0x2faae1)),
        SettingsCellModel(icon: "globe-americas", title: "Language", color: UIColor(rgb: 0xab53dc), rightText: "English"),
        SettingsCellModel(icon: "server", title: "Data and Storage", color: UIColor(rgb: 0x29cb58)),
        SettingsCellModel(icon: "coins", title: "Credit", color: UIColor(rgb: 0xfa940b)),
        SettingsCellModel(icon: "lightbulb", title: "About ShakeBottles", color: UIColor(rgb: 0xf7cf05)),
    ]
}
