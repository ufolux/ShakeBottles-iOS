//
//  MeTableViewDataSource.swift
//  ShakeBottles
//
//  Created by Sines on 3/27/22.
//

import Foundation
import UIKit

class MeTableViewDelegate: NSObject, UITableViewDataSource, UITableViewDelegate {
    private var vm: MeVM!
    private let CellIdentifier = "com.shakebottles.MeSettingsCell"
    
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
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier, for: indexPath)
        cell.textLabel?.text = vm.settingsTableViewArray[indexPath.row].title
        cell.imageView?.image = UIImage(from: .fontAwesome5, code: vm.settingsTableViewArray[indexPath.row].icon, textColor: .systemBlue, backgroundColor: .lightGray, size: CGSize(width: 24, height: 24))
        return cell
    }
}
