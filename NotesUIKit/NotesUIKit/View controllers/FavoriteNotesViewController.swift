//
//  FavoriteNotesViewController.swift
//  NotesUIKit
//
//  Created by Andrei Sadovnicov on 20.9.2022.
//

import UIKit
import RealmSwift

class FavoriteNotesViewController: UIViewController {
    
    // MARK: - PROPERTIES
    
    // MARK: - @IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Model
    private let dataStore = DataStore.shared
    private let notes = DataStore.shared.getFavoriteNotes()
    private var notificationToken: NotificationToken!
    
    // MARK: - METHODS
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Set tableview data source and delegate
        tableView.dataSource = self
        tableView.delegate = self
        
        // Register cell's xib
        tableView.register(NoteTableViewCell.nib, forCellReuseIdentifier: NoteTableViewCell.identifier)
        
        // Observers
        setupObservers()
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let note = sender as? Note else {
            return
        }
        
        if segue.identifier == Constants.toEditNoteSegue {
            let vc = segue.destination as! EditNoteViewController
            vc.note = note
        }
    }
}

// MARK: - EXTENSIONS

// MARK: - UITableViewDataSource
extension FavoriteNotesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NoteTableViewCell.identifier, for: indexPath) as! NoteTableViewCell
        let note = notes[indexPath.row]
        cell.titleLabel.text = note.title
        cell.bodyLabel.text = note.subtitle
        cell.bodyLabel.isHidden = note.subtitle == nil
        cell.isFavorite = note.isFavorite
        cell.delegate = self
        cell.model = note
        return cell
    }
}

// MARK: - UITableViewDelegate
extension FavoriteNotesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let note = notes[indexPath.row]
        performSegue(withIdentifier: Constants.toEditNoteSegue, sender: note)
    }
}

// MARK: - NoteTableViewCellDelegate
extension FavoriteNotesViewController: NoteTableViewCellDelegate {
    func favoriteButtonTapped(for model: Any?) {
        guard let note = model as? Note else {
            return
        }
        dataStore.toggleFavorite(for: note)
    }
}

// MARK: - Realm notifications
private extension FavoriteNotesViewController {
    func setupObservers() {
        // Set results notification block
        self.notificationToken = notes.observe { (changes: RealmCollectionChange) in
            switch changes {
            case .initial:
                // Results are now populated and can be accessed without blocking the UI
                self.tableView.reloadData()
            case .update(_, let deletions, let insertions, let modifications):
                // Query results have changed, so apply them to the TableView
                self.tableView.beginUpdates()
                self.tableView.insertRows(at: insertions.map { IndexPath(row: $0, section: 0) }, with: .automatic)
                self.tableView.deleteRows(at: deletions.map { IndexPath(row: $0, section: 0) }, with: .automatic)
                self.tableView.reloadRows(at: modifications.map { IndexPath(row: $0, section: 0) }, with: .automatic)
                self.tableView.endUpdates()
            case .error(let err):
                // An error occurred while opening the Realm file on the background worker thread
                print("\(err)")
            }
        }
    }
}
