//
//  Note.swift
//  NotesSwiftUI
//
//  Created by Andrei Sadovnicov on 20.9.2022.
//

import Foundation
import Realm
import RealmSwift

class Note: Object, ObjectKeyIdentifiable {
    // MARK: - PROPERTIES
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var content: String = ""
    @Persisted var title: String? = nil
    @Persisted var subtitle: String? = nil
    @Persisted var isFavorite = false
    @Persisted var lastUpdate = Date()
    
    // MARK: - INITIALIZERS
    convenience init(content: String) {
        self.init()
        self.content = content
        self.setTitleAndSubtitle()
    }
    
    // MARK: - METHODS
    func setTitleAndSubtitle() {
        let rows = content.components(separatedBy: CharacterSet.newlines)
        title = rows.first
        subtitle = rows.count > 1 ? rows[1] : nil
    }
}

