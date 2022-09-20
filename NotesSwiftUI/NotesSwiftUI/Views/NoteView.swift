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
    
    // MARK: - INITIALIZERS
    init(title: String?, subtitle: String?, isFavorite: Bool) {
        self.title = title
        self.subtitle = subtitle
        self.isFavorite = isFavorite
    }
    
    // MARK: - BODY
    var body: some View {
        VStack {
            HStack(spacing: 5) {
                Button(action: {
                    
                }, label: {
                    Label("", systemImage: isFavorite ? "heart.fill" : "heart")
                })
                VStack(alignment: .leading, spacing: 5) {
                    Text(title ?? "").font(.headline)
                    Text(subtitle ?? "").font(.subheadline)
                }
            }
        }
    }
}

struct NoteView_Previews: PreviewProvider {
    static var previews: some View {
        let note = Constants.testNote
        NoteView(title: note.title, subtitle: note.subtitle, isFavorite: note.isFavorite)
    }
}
