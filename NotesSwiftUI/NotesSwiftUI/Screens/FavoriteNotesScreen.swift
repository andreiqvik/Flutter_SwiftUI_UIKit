//
//  FavoriteNotesScreen.swift
//  NotesSwiftUI
//
//  Created by Andrei Sadovnicov on 20.9.2022.
//

import SwiftUI
import RealmSwift

struct FavoriteNotesScreen: View {
    // MARK: - PROPERTIES
    
    // MARK: - Model
    @ObservedResults(
      Note.self,
      where: { $0.isFavorite == true },
      sortDescriptor:
        SortDescriptor(keyPath: Constants.lastUpdateKeyPath, ascending: false)
    ) var notes
    
    // MARK: - BODY
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack {
                    ForEach (notes) { note in
                        NavigationLink(destination: {
                            EditNoteScreen(note: note)
                        }, label: {
                            NoteCell(note: note)
                        })
                    }
                    Spacer()
                }
            }
            .navigationBarTitle("Favorite notes").navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct FavoriteNotesScreen_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteNotesScreen()
    }
}
