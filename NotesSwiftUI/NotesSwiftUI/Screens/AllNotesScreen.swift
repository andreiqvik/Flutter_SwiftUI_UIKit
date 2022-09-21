//
//  AllNotesScreen.swift
//  NotesSwiftUI
//
//  Created by Andrei Sadovnicov on 20.9.2022.
//

import SwiftUI
import RealmSwift

struct AllNotesScreen: View {
    // MARK: - PROPERTIES
    
    // MARK: - Model
    let dataStore = DataStore.shared
    
    @ObservedResults(
      Note.self
    ) var notes
    
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
            .toolbar {
                Button(action: {
                    dataStore.addNote()
                }, label: {
                    Label("", systemImage: "plus")
                })
                }
        }
    }
}

struct AllNotesScreen_Previews: PreviewProvider {
    static var previews: some View {
        AllNotesScreen()
    }
}
