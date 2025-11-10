//
//  RootView.swift
//  Gratitude Journal
//
//  Created by Michael Beland on 11/9/25.
//

import SwiftUI

struct RootView: View {
    var body: some View {
        TabView {
            EntriesView()
                .tabItem { Label("Journal", systemImage: "list.bullet") }
            SettingsView()
                .tabItem { Label("Settings", systemImage: "gearshape") }
        }
    }
}
