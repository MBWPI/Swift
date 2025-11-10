//
//  EntryDetailView.swift
//  Gratitude Journal
//
//  Created by Michael Beland on 11/9/25.
//

import SwiftUI

struct EntryDetailView: View {
    @EnvironmentObject var store: EntryStore
    let entry: Entry
    @State private var title: String
    @State private var note: String

    init(entry: Entry) {
        self.entry = entry
        _title = State(initialValue: entry.title)
        _note = State(initialValue: entry.note ?? "")
    }

    var body: some View {
        Form {
            Section("Title") { TextField("Title", text: $title) }
            Section("Details") { TextEditor(text: $note).frame(minHeight: 160) }

            Section("Meta") {
                HStack {
                    Label("Created", systemImage: "calendar")
                    Spacer()
                    Text(entry.date.formatted(date: .abbreviated, time: .shortened))
                        .foregroundStyle(.secondary)
                }
            }

            Section {
                ShareLink(item: shareText())
            }
        }
        .navigationTitle("Entry")
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                Button("Save") {
                    store.update(entry,
                                 title: title.trimmingCharacters(in: .whitespacesAndNewlines),
                                 note: note.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ? nil : note)
                }
                .disabled(title.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
            }
        }
    }

    private func shareText() -> String {
        var lines = ["Gratitude: \(title)"]
        if !note.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            lines.append(note)
        }
        lines.append("Logged on \(entry.date.formatted(date: .abbreviated, time: .shortened))")
        return lines.joined(separator: "\n\n")
    }
}
