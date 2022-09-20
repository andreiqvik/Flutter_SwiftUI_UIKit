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
    
    // MARK: - METHODS
    override func viewDidLoad() {
        super.viewDidLoad()

        textView.text = note.content
    }
}
