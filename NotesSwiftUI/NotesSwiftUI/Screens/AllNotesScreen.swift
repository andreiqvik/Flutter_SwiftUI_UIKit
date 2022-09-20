//
//  AllNotesScreen.swift
//  NotesSwiftUI
//
//  Created by Andrei Sadovnicov on 20.9.2022.
//

import SwiftUI

struct AllNotesScreen: View {
    var body: some View {
        NavigationView {
            NavigationLink(destination: EditNoteScreen(), label: {
                Text("All notes")
            })
            
            .navigationBarTitle("Notes").navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct AllNotesScreen_Previews: PreviewProvider {
    static var previews: some View {
        AllNotesScreen()
    }
}
