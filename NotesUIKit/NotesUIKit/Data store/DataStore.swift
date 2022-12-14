//
//  DataStore.swift
//  NotesUIKit
//
//  Created by Andrei Sadovnicov on 20.9.2022.
//

import Foundation
import RealmSwift

class DataStore {
    
    // MARK: - PROPERTIES
    
    // MARK: - Singleton
    static let shared = DataStore()
    
    // MARK: - Realm
    private let realm = try! Realm()
    
    // MARK: - METHODS
    
    // MARK: - CREATE
    func addNote() {
        let note = Note(content: Constants.defaultNoteContent)
        try! realm.write {
            realm.add(note)
        }
    }
    
    // MARK: - READ
    func getAllNotes() -> Results<Note> {
        return realm.objects(Note.self).sorted(byKeyPath: Constants.lastUpdateKeyPath, ascending: false)
    }
    
    func getFavoriteNotes() -> Results<Note> {
        return realm.objects(Note.self).where{$0.isFavorite == true}.sorted(byKeyPath: Constants.lastUpdateKeyPath, ascending: false)
    }
    
    // MARK: - UPDATE
    func toggleFavorite(for note: Note) {
        try! realm.write() {
            note.isFavorite.toggle()
        }
    }
    
    func update(_ note: Note, content: String? = nil) {
        try! realm.write {
            note.lastUpdate = Date()
            if let content = content {
                note.content = content
                note.setTitleAndSubtitle()
            }
        }
    }
    
    // MARK: - DELETE
    func delete(_ note: Note) {
        try! realm.write {
            realm.delete(note)
        }
    }
    
}
