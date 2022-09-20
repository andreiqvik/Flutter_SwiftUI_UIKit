//
//  FavoriteNotesScreen.swift
//  NotesSwiftUI
//
//  Created by Andrei Sadovnicov on 20.9.2022.
//

import SwiftUI

struct FavoriteNotesScreen: View {
    var body: some View {
        NavigationView {
            Text("Favorite notes")
            .navigationBarTitle("Favorite notes").navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct FavoriteNotesScreen_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteNotesScreen()
    }
}
