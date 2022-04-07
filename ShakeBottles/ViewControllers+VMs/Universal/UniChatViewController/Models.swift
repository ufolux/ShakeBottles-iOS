//
//  Models.swift
//  ShakeBottles
//
//  Created by Sines on 4/6/22.
//

import Foundation

class UniDateSectionModel: BaseModel {
    var dateStr: String!
    init(_ timeStamp: TimeInterval) {
        super.init()
        let calendar = Calendar.current
        let date = Date(timeIntervalSinceReferenceDate: timeStamp)
        let curDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = .none
        dateFormatter.locale = Locale.current
        if calendar.compare(date, to: curDate, toGranularity: .year) == .orderedSame {
            dateFormatter.dateFormat = "MMMM d"
            dateStr = dateFormatter.string(from: date)
        } else {
            dateFormatter.dateStyle = .full
            dateStr = dateFormatter.string(from: date)
        }
    }
}


class UniChatTextCellModel: BaseModel {
    
}
