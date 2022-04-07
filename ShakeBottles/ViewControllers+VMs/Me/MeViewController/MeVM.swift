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

struct SettingsCellModel {
    var icon: String = ""
    var title: String = ""
    var rightText: String = ""
    var tableIndex: UInt = 0
}

final class MeVM: BaseViewModel, MeBaseCoordinated {
    let settingsTableViewArray: Array<SettingsCellModel> = [
        SettingsCellModel(icon: "Appearance", title: "Appearance", tableIndex: 0),
        SettingsCellModel(icon: "Language", title: "Language", rightText: "English", tableIndex: 1),
        SettingsCellModel(icon: "DataStorage", title: "Data and Storage", tableIndex: 2),
        SettingsCellModel(icon: "Credit", title: "Credit", tableIndex: 3),
        SettingsCellModel(icon: "About", title: "About ShakeBottles", tableIndex: 4),
    ]
    var coordinator: MeBaseCoordinator?
}
