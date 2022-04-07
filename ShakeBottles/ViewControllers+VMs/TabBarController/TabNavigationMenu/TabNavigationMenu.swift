//
// Created by Sines on 3/25/22.
//

import Foundation
import UIKit
import SnapKit

class TabNavigationMenu: BaseView {
    var itemTapped: ((_ tab: Int) -> Void)?
    var activeItem: Int = 0

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    convenience init(menuItems: [TabItem], frame: CGRect, defaultIndex: Int = 0) {
        self.init(frame: frame)
        backgroundColor = UIColor.darkGray
        isUserInteractionEnabled = true
        clipsToBounds = true

        for i in 0 ..< menuItems.count {
            let itemWidth = self.frame.width / CGFloat(menuItems.count)
            let leadingAnchor = itemWidth * CGFloat(i)
            let itemView = createTabItem(item: menuItems[i])
            itemView.tag = i
            addSubview(itemView)
            itemView.translatesAutoresizingMaskIntoConstraints = false
            itemView.clipsToBounds = true
            itemView.snp.makeConstraints { make in
                make.height.equalTo(self.snp.height)
                make.width.equalTo(itemWidth)
                make.leading.equalTo(self.snp.leading).offset(leadingAnchor)
                make.top.equalTo(self.snp.top)
            }
        }
        setNeedsLayout()
        layoutIfNeeded()
        activateTab(tab: defaultIndex)
    }

    func createTabItem(item: TabItem) -> UIView {
        let tabBarItem = BaseView(frame: CGRect.zero)
        let itemTitleLabel = UILabel(frame: CGRect.zero)
        let itemIconView = BaseImageView(frame: CGRect.zero)
        let selectedItemView = BaseImageView(frame: CGRect.zero)

        // adding tags to get views for modification when selected/unselected
        tabBarItem.tag = 11
        itemTitleLabel.tag = 12
        itemIconView.tag = 13
        selectedItemView.tag = 14

        itemTitleLabel.text = item.displayTitle
        itemTitleLabel.font = UIFont.systemFont(ofSize: 16)
        itemTitleLabel.textColor = .black // changing color to white
        itemTitleLabel.textAlignment = .left
        itemTitleLabel.textAlignment = .center
        itemTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        itemTitleLabel.clipsToBounds = true
        itemTitleLabel.isHidden = true // hiding label for now

        itemIconView.image = item.icon!.withRenderingMode(.automatic)
        itemIconView.contentMode = .scaleAspectFit // added to stop stretching
        itemIconView.translatesAutoresizingMaskIntoConstraints = false
        itemIconView.clipsToBounds = true
        tabBarItem.layer.backgroundColor = UIColor.clear.cgColor
        tabBarItem.addSubview(itemIconView)
        tabBarItem.addSubview(itemTitleLabel)
        tabBarItem.translatesAutoresizingMaskIntoConstraints = false
        tabBarItem.clipsToBounds = true
        // constraints
        itemIconView.snp.makeConstraints { make in
            make.height.equalTo(44)
            make.width.equalTo(44)
            make.centerX.equalTo(tabBarItem.snp.centerX)
            make.centerY.equalTo(tabBarItem.snp.centerY)
        }
        itemTitleLabel.snp.makeConstraints { make in
            make.height.equalTo(16)
            make.leading.equalTo(itemIconView.snp.trailing).offset(2)
            make.centerY.equalTo(tabBarItem.snp.centerY)
        }
        tabBarItem.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap))) // Each item should be able to trigger and action on tap
        return tabBarItem
    }

    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        switchTab(from: activeItem, to: sender.view!.tag)
    }

    func switchTab(from: Int, to: Int) {
        deactivateTab(tab: from)
        activateTab(tab: to)
    }

    func activateTab(tab: Int) {
        let tabToActivate = subviews[tab]

        // showing title label on selection
        tabToActivate.viewWithTag(12)?.isHidden = false // showing label
        tabToActivate.viewWithTag(14)?.isHidden = false // showing selected tab background

        // changing constraints for animation
        NSLayoutConstraint.deactivate(tabToActivate.constraints.filter({$0.firstItem === tabToActivate.viewWithTag(13) && $0.firstAttribute == .centerX}))
        NSLayoutConstraint.activate([tabToActivate.viewWithTag(13)!.centerXAnchor.constraint(equalTo: tabToActivate.centerXAnchor, constant: -20)])

        // transform effect for selectedtab background
        UIView.animate(withDuration: 0.25, animations: {
            tabToActivate.viewWithTag(14)?.transform = CGAffineTransform(scaleX: 1, y: 1)
            self.layoutIfNeeded()
        }) { (Bool) in
            tabToActivate.viewWithTag(14)?.isHidden = false
        }

        itemTapped?(tab)
        activeItem = tab
    }

    func deactivateTab(tab: Int) {
        let inactiveTab = subviews[tab]
        // hiding label again when deselected

        inactiveTab.viewWithTag(12)?.isHidden = true
        //inactiveTab.viewWithTag(14)?.isHidden = true

        // changing constraints for animation
        NSLayoutConstraint.deactivate(inactiveTab.constraints.filter({$0.firstItem === inactiveTab.viewWithTag(13) && $0.firstAttribute == .centerX}))
        NSLayoutConstraint.activate([inactiveTab.viewWithTag(13)!.centerXAnchor.constraint(equalTo: inactiveTab.centerXAnchor)])
        layoutIfNeeded()
        UIView.animate(withDuration: 0.25, animations: {
            inactiveTab.viewWithTag(14)?.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
            self.layoutIfNeeded()
        }) { (Bool) in
            inactiveTab.viewWithTag(14)?.isHidden = true
        }
    }
}
