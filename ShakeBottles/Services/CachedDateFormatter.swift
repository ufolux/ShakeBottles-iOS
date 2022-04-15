//
//  CachedDateFormatter.swift
//  ShakeBottles
//
//  Created by Sines on 4/15/22.
//

import Foundation

final class CachedDateFormatter {
    static let shared = CachedDateFormatter()
    let chatTimeHeaderShort = DateFormatter()
    let chatTimeHeaderFull = DateFormatter()
    let chatBubble = DateFormatter()
    private init() {
        chatTimeHeaderShort.timeStyle = .none
        chatTimeHeaderShort.locale = Locale.current
        chatTimeHeaderShort.dateFormat = "MMMM d"
        
        chatTimeHeaderFull.timeStyle = .none
        chatTimeHeaderFull.locale = Locale.current
        chatTimeHeaderFull.dateStyle = .full
        
        chatBubble.locale = Locale.current
        chatBubble.dateFormat = "h:mm a"
    }
}
