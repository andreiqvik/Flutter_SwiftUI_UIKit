//
//  AllNotesScreen.swift
//  NotesSwiftUI
//
//  Created by Andrei Sadovnicov on 20.9.2022.
//

import SwiftUI

struct AllNotesScreen: View {
    // MARK: - PROPERTIES
    
    // MARK: - Model
    private let notes = DataStore.shared.getAllNotes()
    
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
            .navigationBarTitle("Notes").navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct AllNotesScreen_Previews: PreviewProvider {
    static var previews: some View {
        AllNotesScreen()
    }
}
