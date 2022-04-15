//
//  Models.swift
//  ShakeBottles
//
//  Created by Sines on 4/6/22.
//

import UIKit

class UniDateSectionModel: BaseModel {
    var dateStr: String!
    init(_ timeStamp: TimeInterval) {
        super.init()
        let calendar = Calendar.current
        let date = Date(timeIntervalSince1970: timeStamp)
        let curDate = Date()
        if calendar.compare(date, to: curDate, toGranularity: .year) == .orderedSame {
            dateStr = CachedDateFormatter.shared.chatTimeHeaderShort.string(from: date)
        } else {
            dateStr = CachedDateFormatter.shared.chatTimeHeaderFull.string(from: date)
        }
    }
}

enum MsgStatus {
    case read
    case unread
    case sending
    case failed
    case none
    
    private static let readIcon = UIImage(systemName: "checkmark.circle")!.withRenderingMode(.alwaysOriginal).withTintColor(AppearanceManager.shared.colors.msgStatusRead)
    private static let unreadIcon = UIImage(systemName: "checkmark")!.withRenderingMode(.alwaysOriginal).withTintColor(AppearanceManager.shared.colors.msgStatusNormal)
    private static let sendingIcon = UIImage(systemName: "timer")!.withRenderingMode(.alwaysOriginal).withTintColor(AppearanceManager.shared.colors.msgStatusNormal)
    private static let failedIcon = UIImage(systemName: "xmark.circle")!.withRenderingMode(.alwaysOriginal).withTintColor(AppearanceManager.shared.colors.msgStatusFailed)
    
    var icon: UIImage? {
        switch self {
        case .read:
            return Self.readIcon
        case .unread:
            return Self.unreadIcon
        case .sending:
            return Self.sendingIcon
        case .failed:
            return Self.failedIcon
        case .none:
            return nil
        }
    }
}

class UniChatTextCellModel: BaseModel {
    var message: String
    var timeStr: String
    var status: MsgStatus

    init(message: String, timestamp: TimeInterval, status: MsgStatus) {
        let date = Date(timeIntervalSince1970: timestamp)
        self.message = message
        self.timeStr = CachedDateFormatter.shared.chatBubble.string(from: date)
        self.status = status
    }
}


class UniChatImageCellModel: BaseModel {
    var imageURL: URL
    var timeStr: String
    var status: MsgStatus

    init(imageURL: URL, timestamp: TimeInterval, status: MsgStatus) {
        let date = Date(timeIntervalSince1970: timestamp)
        self.imageURL = imageURL
        self.timeStr = CachedDateFormatter.shared.chatBubble.string(from: date)
        self.status = status
    }
}
