//
//  DataStore.swift
//  NotesUIKit
//
//  Created by Andrei Sadovnicov on 20.9.2022.
//

import Foundation

class DataStore {
    // MARK: - READ
    func getAllNotes() -> [Note] {
        return [
            Note(content: "Note 1", isFavorite: true),
            Note(content: "Note 2", isFavorite: false),
            Note(content: "Note 3", isFavorite: false),
        ]
    }
    
    // MARK: - CREATE
    
    // MARK: - UPDATE
    
    // MARK: - DELETE
    
}
