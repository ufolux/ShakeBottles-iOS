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
    var tableIndex: UInt
}

final class MeVM: BaseViewModel, MeBaseCoordinated {
    let settingsTableViewArray: Array<SettingsCellModel> = [
        SettingsCellModel(icon: "palette", title: "Appearance", color: UIColor(0x2faae1), tableIndex: 0),
        SettingsCellModel(icon: "globe-americas", title: "Language", color: UIColor(0xab53dc), rightText: "English", tableIndex: 1),
        SettingsCellModel(icon: "server", title: "Data and Storage", color: UIColor(0x29cb58), tableIndex: 2),
        SettingsCellModel(icon: "coins", title: "Credit", color: UIColor(0xfa940b), tableIndex: 3),
        SettingsCellModel(icon: "lightbulb", title: "About ShakeBottles", color: UIColor(0xf7cf05), tableIndex: 4),
    ]
    var coordinator: MeBaseCoordinator?
}
