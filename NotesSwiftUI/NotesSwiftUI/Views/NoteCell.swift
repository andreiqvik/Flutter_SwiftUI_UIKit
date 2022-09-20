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
        VStack {
            HStack(spacing: 5) {
                Button(action: {
                    
                }, label: {
                    Label("", systemImage: note.isFavorite ? "heart.fill" : "heart")
                })
                VStack(alignment: .leading, spacing: 5) {
                    Text(note.title ?? "").font(.headline)
                    Text(note.subtitle ?? "").font(.subheadline)
                }
            }
        }
    }
}

struct NoteView_Previews: PreviewProvider {
    static var previews: some View {
        let note = Constants.testNote
        note.isFavorite = true
        return NoteCell(note: note).previewLayout(.sizeThatFits)
    }
}
