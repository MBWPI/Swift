//
//  NewEntryView.swift
//  Gratitude Journal
//
//  Created by Michael Beland on 11/9/25.
//

import SwiftUI

struct NewEntryView: View {
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var store: EntryStore
    @State private var title: String = ""
    @State private var note: String = ""

    var body: some View {
        NavigationStack {
            Form {
                Section("Title") {
                    TextField("Something you're grateful for…", text: $title)
                }
                Section("Details (optional)") {
                    TextEditor(text: $note).frame(minHeight: 120)
                }
            }
            .navigationTitle("New Entry")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") { dismiss() }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        store.add(title: title.trimmingCharacters(in: .whitespacesAndNewlines),
                                  note: note.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ? nil : note)
                        dismiss()
                    }
                    .disabled(title.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
                }
            }
        }
    }
}
