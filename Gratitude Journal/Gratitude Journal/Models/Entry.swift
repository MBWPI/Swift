//
//  Entry.swift
//  Gratitude Journal
//
//  Created by Michael Beland on 11/8/25.
//

import Foundation

struct Entry: Identifiable, Codable, Equatable {
    let id: UUID
    var title: String
    var note: String?
    var date: Date

    init(id: UUID = UUID(), title: String, note: String? = nil, date: Date = Date()) {
        self.id = id
        self.title = title
        self.note = note
        self.date = date
    }
}
