//
//  MainView.swift
//  NotesSwiftUI
//
//  Created by Andrei Sadovnicov on 20.9.2022.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            AllNotesScreen()
                .tabItem {
                    Label("All notes", systemImage: "list.dash")
                }
            FavoriteNotesScreen()
                .tabItem {
                    Label("Favorite notes", systemImage: "heart")
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
