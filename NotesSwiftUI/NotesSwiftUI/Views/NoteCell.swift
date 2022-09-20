//
//  NoteCell.swift
//  NotesSwiftUI
//
//  Created by Andrei Sadovnicov on 20.9.2022.
//

import SwiftUI

struct NoteCell: View {
    
    // MARK: - PROPERTIES
    
    // MARK: - Model
    let note: Note
    
    // MARK: - INITIALIZERS
    init(note: Note) {
        self.note = note
    }
    
    // MARK: - BODY
    var body: some View {
        NoteView(title: note.title, subtitle: note.subtitle, isFavorite: note.isFavorite)
    }
}

struct NoteCell_Previews: PreviewProvider {
    static var previews: some View {
        let note = Constants.testNote
        note.isFavorite = true
        return NoteCell(note: note).previewLayout(.sizeThatFits)
    }
}
