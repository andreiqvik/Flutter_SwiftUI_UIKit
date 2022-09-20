//
//  DataStore.swift
//  NotesUIKit
//
//  Created by Andrei Sadovnicov on 20.9.2022.
//

import Foundation

class DataStore {
    
    // MARK: - Singleton
    static let shared = DataStore()
    
    // MARK: - READ
    func getAllNotes() -> [Note] {
        return [
            Note(content: "Note 1", isFavorite: true),
            Note(content: "Note 2", isFavorite: false),
            Note(content: """
            Note 3
            Subtitle
            """,
            isFavorite: false),
        ]
    }
    
    func getFavoriteNotes() -> [Note] {
        let allNotes = getAllNotes()
        return allNotes.filter{$0.isFavorite}
    }
    
    // MARK: - CREATE
    
    // MARK: - UPDATE
    
    // MARK: - DELETE
    
}
