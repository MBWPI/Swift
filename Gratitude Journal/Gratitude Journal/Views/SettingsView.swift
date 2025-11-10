//
//  SettingsView.swift
//  Gratitude Journal
//
//  Created by Michael Beland on 11/9/25.
//

import SwiftUI

struct SettingsView: View {
    @AppStorage("appearance") private var appearance: Int = 0 // 0 system, 1 light, 2 dark

    var body: some View {
        NavigationStack {
            Form {
                Picker("Appearance", selection: $appearance) {
                    Text("System Default").tag(0)
                    Text("Light").tag(1)
                    Text("Dark").tag(2)
                }
                Link("Privacy Policy", destination: URL(string: "https://example.com/gratitude-one-privacy")!)
            }
            .navigationTitle("Settings")
        }
        .preferredColorScheme(preferredScheme())
    }

    private func preferredScheme() -> ColorScheme? {
        switch appearance {
        case 1: return .light
        case 2: return .dark
        default: return nil
        }
    }
}
