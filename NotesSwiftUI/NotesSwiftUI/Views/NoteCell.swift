//
//  NoteCell.swift
//  NotesSwiftUI
//
//  Created by Andrei Sadovnicov on 20.9.2022.
//

import SwiftUI
import RealmSwift

struct NoteCell: View {
    
    // MARK: - PROPERTIES
    
    // MARK: - Model
    @ObservedRealmObject var note: Note
    let dataStore = DataStore.shared
    
    // MARK: - BODY
    var body: some View {
        NoteView(title: note.title, subtitle: note.subtitle, isFavorite: note.isFavorite, action: {
            withAnimation {
                dataStore.toggleFavorite(for: note)
            }
        })
    }
}

struct NoteCell_Previews: PreviewProvider {
    static var previews: some View {
        let note = Constants.testNote
        note.isFavorite = true
        return NoteCell(note: note).previewLayout(.sizeThatFits)
    }
}
