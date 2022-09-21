//
//  EditNoteViewController.swift
//  NotesUIKit
//
//  Created by Andrei Sadovnicov on 20.9.2022.
//

import UIKit

class EditNoteViewController: UIViewController {
    
    // MARK: - PROPERTIES
    
    // MARK: - @IBOutlets
    @IBOutlet weak var textView: UITextView!
    
    // MARK: - Model
    var note: Note!
    private let dataStore = DataStore.shared
    
    // MARK: - METHODS
    
    // MARK: - @IBActions
    @IBAction func deleteButtonTapped(_ sender: UIBarButtonItem) {
        dataStore.delete(note)
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        textView.text = note.content
        textView.delegate = self
    }
}

// MARK: - EXTENSIONS

// MARK: - UITextViewDelegate
extension EditNoteViewController: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        dataStore.update(note, content: textView.text ?? "")
    }
}
