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
    var icon: String
    var title: String
    var rightText: String = ""
}

final class MeVM: BaseViewModel {
    let settingsTableViewArray: Array<SettingsCellModel> = [
        SettingsCellModel(icon: "circle-half-stroke", title: "Appearance"),
        SettingsCellModel(icon: "language", title: "Language", rightText: "English"),
        SettingsCellModel(icon: "database", title: "Data and Storage"),
        SettingsCellModel(icon: "circle-star", title: "Credit"),
        SettingsCellModel(icon: "lightbulb", title: "About ShakeBottles"),
    ]
}
