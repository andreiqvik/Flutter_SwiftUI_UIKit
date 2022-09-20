//
//  Note.swift
//  NotesSwiftUI
//
//  Created by Andrei Sadovnicov on 20.9.2022.
//

import Foundation

class Note {
    // MARK: - PROPERTIES
    var content: String = ""
    var title: String?
    var subtitle: String?
    var isFavorite = false
    
    // MARK: - INITIALIZERS
    init(content: String, isFavorite: Bool = false) {
        self.content = content
        self.isFavorite = isFavorite
        self.setTitleAndSubtitle()
    }
    
    // MARK: - METHODS
    private func setTitleAndSubtitle() {
        let rows = content.components(separatedBy: CharacterSet.newlines)
        title = rows.first
        subtitle = rows.count > 1 ? rows[1] : nil
    }
}
