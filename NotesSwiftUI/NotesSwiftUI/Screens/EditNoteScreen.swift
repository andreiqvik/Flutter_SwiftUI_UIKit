//
//  EditNoteScreen.swift
//  NotesSwiftUI
//
//  Created by Andrei Sadovnicov on 20.9.2022.
//

import SwiftUI

struct EditNoteScreen: View {
    // MARK: - PROPERTIES
    
    // MARK: - Model
    let note: Note
    @State private var content: String = "Note"
    
    // MARK: - INITIALIZERS
    init(note: Note) {
        self.note = note
    }
    
    // MARK: - BODY
    var body: some View {
        TextEditor(text: $content).padding(.all)          .navigationBarTitle("Edit").navigationBarTitleDisplayMode(.inline)
            .toolbar {
                Button(action: {
                    
                }, label: {
                    Label("", systemImage: "trash")
                })
            }
    }
}

struct EditNoteScreen_Previews: PreviewProvider {
    static var previews: some View {
        EditNoteScreen(note: Constants.testNote)
    }
}
