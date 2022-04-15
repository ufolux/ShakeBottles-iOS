//
//  UniCellEnum.swift
//  ShakeBottles
//
//  Created by Sines on 4/6/22.
//

import Foundation
import UIKit


enum UniChatCellShape {
    case arrow
    case round
}

enum UniChatCellSideType {
    case other
    case me
}

enum UniChatCellType {
    case text(UniChatCellSideType, UniChatCellShape)
    case image(UniChatCellSideType, UniChatCellShape)
}

