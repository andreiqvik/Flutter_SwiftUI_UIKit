//
//  NotesSwiftUIApp.swift
//  NotesSwiftUI
//
//  Created by Andrei Sadovnicov on 20.9.2022.
//

import SwiftUI

@main
struct NotesSwiftUIApp: App {
    
    // MARK: - PROPERTIES
    @StateObject var dataStore = DataStore.shared
    
    var body: some Scene {
        WindowGroup {
            MainTabsScreen().environmentObject(dataStore)
        }
    }
}
