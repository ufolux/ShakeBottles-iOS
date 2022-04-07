//
//  UniCellEnum.swift
//  ShakeBottles
//
//  Created by Sines on 4/6/22.
//

import Foundation
import UIKit


enum UniChatCellSideType {
    case other
    case me
}

enum UniChatCellType {
    case text(UniChatCellSideType)
    case image(UniChatCellSideType)
    
    var cellWithType: UITableViewCell {
        switch self {
        case .text(let cellSideType):
            return UniChatTextTableViewCell(withSideType: cellSideType)
        case .image(let cellSideType):
            return UniChatImageTableViewCell(withSideType: cellSideType)
        }
    }
}

