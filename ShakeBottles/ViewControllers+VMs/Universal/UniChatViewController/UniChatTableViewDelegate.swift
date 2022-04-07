//
// Created by Sines on 4/6/22.
//

import UIKit

class UniChatTableViewDelegate: NSObject, UITableViewDelegate, UITableViewDataSource {
    var vm: UniChatVM!

    init(vm: UniChatVM) {
        super.init()
        self.vm = vm
    }
    
    // MARK: - Section Header
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let timestamp = Date.timeIntervalSinceReferenceDate
        return UniChatDateSectionHeader(cellModel: UniDateSectionModel(timestamp))
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    // MARK: - Rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UniChatCellType.text(.me).cellWithType
        return cell
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
