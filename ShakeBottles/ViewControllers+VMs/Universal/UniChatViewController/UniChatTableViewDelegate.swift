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
    
    // MARK: - Sections
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let timestamp = Date.timeIntervalSinceReferenceDate + Double(1440 * 60 * section)
        return UniChatDateSectionHeader(cellModel: UniDateSectionModel(timestamp))
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    // MARK: - Rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // TODO: Deque TableView Cell
        var cell: UITableViewCell!
        switch indexPath.row % 4 {
        case 0:
            cell = UniChatCellType.text(.me, .round).cell
        case 1:
            cell = UniChatCellType.text(.other, .round).cell
        case 2:
            cell = UniChatCellType.text(.me, .arrow).cell
        case 3:
            cell = UniChatCellType.text(.other, .arrow).cell
        default:
            fatalError("")
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
