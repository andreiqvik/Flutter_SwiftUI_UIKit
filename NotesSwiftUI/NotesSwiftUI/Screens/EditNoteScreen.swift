//
//  EditNoteScreen.swift
//  NotesSwiftUI
//
//  Created by Andrei Sadovnicov on 20.9.2022.
//

import SwiftUI
import RealmSwift

struct EditNoteScreen: View {
    // MARK: - PROPERTIES
    
    // MARK: - Model
    @ObservedRealmObject var note: Note
    @State private var content: String = ""
    let dataStore = DataStore.shared
    
    // MARK: - Environment variables
    @Environment(\.presentationMode) var presentationMode
    
    // MARK: - BODY
    var body: some View {
        TextEditor(text: $content)
            .onChange(of: content) { newValue in
                dataStore.update(note, content: content)
            }
            .padding(.all)          .navigationBarTitle("Edit").navigationBarTitleDisplayMode(.inline)
            .toolbar {
                Button(action: {
                    dataStore.delete(note)
                    self.presentationMode.wrappedValue.dismiss()
                    
                }, label: {
                    Label("", systemImage: "trash")
                })
            }.onAppear {
                content = note.content
            }
    }
}

struct EditNoteScreen_Previews: PreviewProvider {
    static var previews: some View {
        EditNoteScreen(note: Constants.testNote)
    }
}
