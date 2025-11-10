//
//  Item.swift
//  Gratitude Journal
//
//  Created by Michael Beland on 11/8/25.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
