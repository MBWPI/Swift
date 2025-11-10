# Gratitude Journal App

Gratitude Journal is a simple and private daily reflection app built with SwiftUI. It allows you to quickly record moments of gratitude, edit past entries, and revisit meaningful memories over time — all stored securely on your device.

## Features
- Add new gratitude entries with a title and optional note
- Edit and delete existing entries
- Entries are sorted by most recent
- Local-only data storage (no accounts, no cloud tracking)
- Share entries using the iOS share sheet
- Choose light, dark, or system appearance mode
- Clean and distraction-free interface

## Privacy
This app **does not collect or transmit any personal data**. All journal entries are stored locally on your device using Apple's secure system frameworks. No analytics. No ads. No external servers.

## Requirements
- iOS 17.0+
- Xcode 15+
- SwiftUI

## Project Structure (Simplified)
- Models → `Entry.swift` defines a gratitude entry
- Data → `EntryStore.swift` handles saving, loading, and managing entries
- Views → UI screens such as:
  - `RootView.swift` (tab layout)
  - `EntriesView.swift` (list of entries)
  - `NewEntryView.swift` (add entry form)
  - `EntryDetailView.swift` (view/edit entry)
  - `SettingsView.swift` (appearance + policy link)
- Assets → App icon and color assets

## Installation & Running
1. Clone or download this repository.
2. Open the project in **Xcode**.
3. Build and run on a simulator or a physical device.

## App Store Submission
This app is fully functional and suitable for the App Store. You may customize and extend it for your own use.

## License
Released under the MIT License. You are free to modify, distribute, and use this project in personal or commercial applications.
