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
    var icon: String = ""
    var title: String = ""
    var color: UIColor = .black
    var rightText: String = ""
    var tableIndex: UInt = 0
}

final class MeVM: BaseViewModel, MeBaseCoordinated {
    let settingsTableViewArray: Array<SettingsCellModel> = [
        SettingsCellModel(icon: "Appearance", title: "Appearance", color: UIColor(0x2faae1), tableIndex: 0),
        SettingsCellModel(icon: "Language", title: "Language", color: UIColor(0xab53dc), rightText: "English", tableIndex: 1),
        SettingsCellModel(icon: "DataStorage", title: "Data and Storage", color: UIColor(0x29cb58), tableIndex: 2),
        SettingsCellModel(icon: "Credit", title: "Credit", color: UIColor(0xfa940b), tableIndex: 3),
        SettingsCellModel(icon: "About", title: "About ShakeBottles", color: UIColor(0xf7cf05), tableIndex: 4),
    ]
    var coordinator: MeBaseCoordinator?
}
