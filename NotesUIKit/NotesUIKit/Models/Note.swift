//
//  Note.swift
//  NotesUIKit
//
//  Created by Andrei Sadovnicov on 20.9.2022.
//

import Foundation

class Note {
    // MARK: - PROPERTIES
    var content: String = ""
    var title: String?
    var body: String?
    var isFavorite = false
    
    // MARK: - INITIALIZERS
    init(content: String, isFavorite: Bool = false) {
        self.content = content
        self.isFavorite = isFavorite
    }
}
