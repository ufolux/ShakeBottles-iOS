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
        let timestamp = Date.timeIntervalSinceReferenceDate + Date.timeIntervalBetween1970AndReferenceDate
        return UniChatDateSectionHeader(cellModel: UniDateSectionModel(timestamp))
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 50
    }
    
    // MARK: - Rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // TODO: Deque TableView Cell
        var cell: UITableViewCell!
        switch indexPath.row % 7 {
        case 0:
            cell = tableView.dequeueReusableCell(withIdentifier: UniChatTextTableViewCell.reuseIdentifier, for: indexPath)
            let model = UniChatTextCellModel(message: "asssssssssss将viewModel.validatedUsername和UILabel的validationResult绑定, validationResult是UILabel自定义的Rx扩展,源码如下",
                                             timestamp: Date().timeIntervalSince1970,
                                             status: .read)
            (cell as! UniChatTextTableViewCell).update(withModel: model,
                                                       side: .other,
                                                       shape: .round)
        case 1:
            cell = tableView.dequeueReusableCell(withIdentifier: UniChatTextTableViewCell.reuseIdentifier, for: indexPath)
            let model = UniChatTextCellModel(message: "asssssssssss将viewModel.validatedUsername和UILabel的validationResult绑定, validationResult是UILabel自定义的Rx扩展,源码如下",
                                             timestamp: Date().timeIntervalSince1970,
                                             status: .unread)
            (cell as! UniChatTextTableViewCell).update(withModel: model,
                                                       side: .me,
                                                       shape: .arrow)
        case 2:
            cell = tableView.dequeueReusableCell(withIdentifier: UniChatTextTableViewCell.reuseIdentifier, for: indexPath)
            let model = UniChatTextCellModel(message: "asssssssssss将viewModel.validatedUsername和UILabel的validationResult绑定, validationResult是UILabel自定义的Rx扩展,源码如下",
                                             timestamp: Date().timeIntervalSince1970,
                                             status: .read)
            (cell as! UniChatTextTableViewCell).update(withModel: model,
                                                       side: .other,
                                                       shape: .round)
        case 3:
            cell = tableView.dequeueReusableCell(withIdentifier: UniChatTextTableViewCell.reuseIdentifier, for: indexPath)
            let model = UniChatTextCellModel(message: "asssssssssss将viewModel.validatedUsername和UILabel的validationResult绑定, validationResult是UILabel自定义的Rx扩展,源码如下",
                                             timestamp: Date().timeIntervalSince1970,
                                             status: .failed)
            (cell as! UniChatTextTableViewCell).update(withModel: model,
                                                       side: .me,
                                                       shape: .arrow)
        case 4:
            cell = tableView.dequeueReusableCell(withIdentifier: UniChatTextTableViewCell.reuseIdentifier, for: indexPath)
            let model = UniChatTextCellModel(message: "asssssssssss将viewModel.validatedUsername和UILabel的validationResult绑定, validationResult是UILabel自定义的Rx扩展,源码如下",
                                             timestamp: Date().timeIntervalSince1970,
                                             status: .none)
            (cell as! UniChatTextTableViewCell).update(withModel: model,
                                                       side: .other,
                                                       shape: .arrow)
        case 5:
            cell = tableView.dequeueReusableCell(withIdentifier: UniChatImageTableViewCell.reuseIdentifier, for: indexPath)
            let model = UniChatImageCellModel(imageURL: URL(string: "https://static.vecteezy.com/packs/media/components/global/search-explore-nav/img/vectors/term-bg-1-666de2d941529c25aa511dc18d727160.jpg")!,
                                             timestamp: Date().timeIntervalSince1970,
                                             status: .sending)
            (cell as! UniChatImageTableViewCell).update(withModel: model,
                                                       side: .me,
                                                       shape: .arrow)
        case 6:
            cell = tableView.dequeueReusableCell(withIdentifier: UniChatImageTableViewCell.reuseIdentifier, for: indexPath)
            let model = UniChatImageCellModel(imageURL: URL(string: "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg")!,
                                             timestamp: Date().timeIntervalSince1970,
                                             status: .sending)
            (cell as! UniChatImageTableViewCell).update(withModel: model,
                                                       side: .other,
                                                       shape: .arrow)
        default:
            fatalError("")
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
