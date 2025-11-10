//
//  EntriesView.swift
//  Gratitude Journal
//
//  Created by Michael Beland on 11/9/25.
//

import SwiftUI

struct EntriesView: View {
    @EnvironmentObject var store: EntryStore
    @State private var showingNew = false

    var body: some View {
        NavigationStack {
            List {
                if store.entries.isEmpty {
                    ContentUnavailableView("No entries yet",
                                           systemImage: "square.and.pencil",
                                           description: Text("Tap the + button to add your first note of gratitude."))
                } else {
                    ForEach(store.entries) { entry in
                        NavigationLink {
                            EntryDetailView(entry: entry)
                        } label: {
                            VStack(alignment: .leading, spacing: 4) {
                                Text(entry.title).font(.headline)
                                if let note = entry.note, !note.isEmpty {
                                    Text(note).font(.subheadline).foregroundStyle(.secondary).lineLimit(2)
                                }
                                Text(entry.date.formatted(date: .abbreviated, time: .shortened))
                                    .font(.caption).foregroundStyle(.secondary)
                            }
                        }
                    }
                    .onDelete(perform: store.delete)
                }
            }
            .navigationTitle("Gratitude One")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    EditButton()
                        .disabled(store.entries.isEmpty)
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button { showingNew = true } label: {
                        Image(systemName: "plus")
                    }
                    .accessibilityLabel("New Entry")
                }
            }

            .sheet(isPresented: $showingNew) {
                NewEntryView()
                    .presentationDetents([.medium, .large])
            }
        }
    }
}
