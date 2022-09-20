//
//  AllNotesViewController.swift
//  NotesUIKit
//
//  Created by Andrei Sadovnicov on 20.9.2022.
//

import UIKit

class AllNotesViewController: UIViewController {
    
    // MARK: - PROPERTIES
    
    // MARK: - @IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Model
    private let notes = DataStore.shared.getAllNotes()
    
    // MARK: - METHODS

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Set tableview data source and delegate
        tableView.dataSource = self
        tableView.delegate = self
        
        // Register cell's xib
        tableView.register(NoteTableViewCell.nib, forCellReuseIdentifier: NoteTableViewCell.identifier)
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
extension AllNotesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NoteTableViewCell.identifier, for: indexPath) as! NoteTableViewCell
        let note = notes[indexPath.row]
        cell.titleLabel.text = note.title
        cell.bodyLabel.text = note.subtitle
        cell.isFavorite = note.isFavorite
        return cell
    }
}

// MARK: - UITableViewDelegate
extension AllNotesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let note = notes[indexPath.row]
        performSegue(withIdentifier: Constants.toEditNoteSegue, sender: note)
    }
}
