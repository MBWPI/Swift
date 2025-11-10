//
//  EntryStore.swift
//  Gratitude Journal
//
//  Created by Michael Beland on 11/9/25.
//

import Foundation
import SwiftUI
import Combine

final class EntryStore: ObservableObject {
    @AppStorage("entries_json") private var entriesJSON: String = "[]"
    @Published var entries: [Entry] = []

    init() { load() }

    func load() {
        if let data = entriesJSON.data(using: .utf8),
           let decoded = try? JSONDecoder().decode([Entry].self, from: data) {
            entries = decoded.sorted { $0.date > $1.date }
        }
    }

    private func save() {
        let encoder = JSONEncoder()
        encoder.outputFormatting = [.sortedKeys]
        if let data = try? encoder.encode(entries),
           let json = String(data: data, encoding: .utf8) {
            entriesJSON = json
        }
    }

    func add(title: String, note: String?) {
        entries.insert(Entry(title: title, note: note), at: 0)
        save()
    }

    func update(_ entry: Entry, title: String, note: String?) {
        if let idx = entries.firstIndex(of: entry) {
            entries[idx].title = title
            entries[idx].note = note
            save()
        }
    }

    func delete(at offsets: IndexSet) {
        entries.remove(atOffsets: offsets)
        save()
    }
}
