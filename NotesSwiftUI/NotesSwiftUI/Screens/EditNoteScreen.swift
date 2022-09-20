//
//  EditNoteScreen.swift
//  NotesSwiftUI
//
//  Created by Andrei Sadovnicov on 20.9.2022.
//

import SwiftUI

struct EditNoteScreen: View {
    var body: some View {
        Text("Edit notes")            .navigationBarTitle("Edit").navigationBarTitleDisplayMode(.inline)
    }
}

struct EditNoteScreen_Previews: PreviewProvider {
    static var previews: some View {
        EditNoteScreen()
    }
}
