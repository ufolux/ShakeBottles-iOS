//
//  MeTableViewDataSource.swift
//  ShakeBottles
//
//  Created by Sines on 3/27/22.
//

import Foundation
import UIKit
import SwiftIconFont

class MeTableViewDelegate: NSObject, UITableViewDataSource, UITableViewDelegate {
    private var vm: MeVM!
    let CellIdentifier = "com.shakebottles.MeSettingsCell"
    init(vm: MeVM) {
        super.init()
        self.vm = vm
    }
    
    // UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    // UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vm.settingsTableViewArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier)
        if cell == nil {
            cell = UITableViewCell(style: .value1, reuseIdentifier: CellIdentifier)
            cell?.backgroundColor = .clear
        }
        cell!.textLabel?.text = vm.settingsTableViewArray[indexPath.row].title
        cell!.imageView?.setIcon(from: .fontAwesome5Solid, code: vm.settingsTableViewArray[indexPath.row].icon, textColor: .white, backgroundColor: .clear, size: CGSize(width: 30, height: 30))
        cell!.imageView?.backgroundColor = vm.settingsTableViewArray[indexPath.row].color
        cell!.imageView?.layer.cornerRadius = 8
        cell!.imageView?.layer.masksToBounds = true
        cell!.detailTextLabel?.text = vm.settingsTableViewArray[indexPath.row].rightText
        cell!.accessoryType = .disclosureIndicator
        return cell!
    }
}
