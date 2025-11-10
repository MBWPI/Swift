//
//  GratitudeOneApp.swift
//  Gratitude Journal
//
//  Created by Michael Beland on 11/8/25.
//

import SwiftUI

@main
struct GratitudeJournalApp: App {
    @StateObject private var store = EntryStore()

    var body: some Scene {
        WindowGroup {
            RootView()
                .environmentObject(store)
        }
    }
}
