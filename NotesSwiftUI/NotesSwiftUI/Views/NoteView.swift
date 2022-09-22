//
//  NoteView.swift
//  NotesSwiftUI
//
//  Created by Andrei Sadovnicov on 20.9.2022.
//

import SwiftUI

struct NoteView: View {
    // MARK: - PROPERTIES
    let title: String?
    let subtitle: String?
    let isFavorite: Bool
    let action: () -> Void
    
    // MARK: - INITIALIZERS
    init(title: String?, subtitle: String?, isFavorite: Bool, action: @escaping () -> Void) {
        self.title = title
        self.subtitle = subtitle
        self.isFavorite = isFavorite
        self.action = action
    }
    
    // MARK: - BODY
    var body: some View {
        VStack(alignment: .leading) {
            HStack(spacing: 5) {
                Button(action: {
                    action()
                }, label: {
                    Label("", systemImage: isFavorite ? "heart.fill" : "heart")
                })
                VStack(alignment: .leading, spacing: 5) {
                    Text(title ?? "").font(.headline).foregroundColor(Color.black)
                    Text(subtitle ?? "").font(.subheadline).foregroundColor(Color.black)
                }
            }
            Divider()
        }.padding(.vertical, 10.0).padding(.horizontal, 30.0)
    }
}

struct NoteView_Previews: PreviewProvider {
    static var previews: some View {
        let note = Constants.testNote
        NoteView(title: note.title, subtitle: note.subtitle, isFavorite: note.isFavorite, action: {})
    }
}
