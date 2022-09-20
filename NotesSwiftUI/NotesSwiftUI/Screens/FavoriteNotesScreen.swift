//
//  FavoriteNotesScreen.swift
//  NotesSwiftUI
//
//  Created by Andrei Sadovnicov on 20.9.2022.
//

import SwiftUI

struct FavoriteNotesScreen: View {
    // MARK: - PROPERTIES
    
    // MARK: - Model
    private let notes = DataStore.shared.getFavoriteNotes()
    
    // MARK: - BODY
    var body: some View {
        NavigationView {
            List {
                ForEach (notes) { note in
                    NavigationLink(destination: {
                        EditNoteScreen(note: note)
                    }, label: {
                        NoteCell(note: note)
                    })
                }
            }
            .scrollContentBackground(.hidden)
            .navigationBarTitle("Favorite notes").navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct FavoriteNotesScreen_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteNotesScreen()
    }
}
