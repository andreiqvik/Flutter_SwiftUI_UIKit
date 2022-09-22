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
    @EnvironmentObject var dataStore: DataStore
    
    @ObservedResults(
      Note.self,
      sortDescriptor:
        SortDescriptor(keyPath: Constants.lastUpdateKeyPath, ascending: false)
    ) var notes
    
    // MARK: - BODY
    var body: some View {
        NavigationView {
            ScrollView() {
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
            .navigationBarTitle("Notes").navigationBarTitleDisplayMode(.inline)
            .toolbar {
                Button(action: {
                    withAnimation {
                        dataStore.addNote()
                    }
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
