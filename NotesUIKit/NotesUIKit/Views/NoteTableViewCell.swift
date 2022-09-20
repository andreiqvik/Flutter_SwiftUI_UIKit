//
//  NoteTableViewCell.swift
//  NotesUIKit
//
//  Created by Andrei Sadovnicov on 20.9.2022.
//

import UIKit

class NoteTableViewCell: UITableViewCell {
    
    // MARK: - PROPERTIES
    
    // MARK: - @IBOutlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    
    // MARK: - Xib registering
    static let identifier = "NoteTableViewCell"

    static var nib: UINib {
           return UINib(nibName: String(describing: self), bundle: nil)
    }
    
    // MARK: - Favorite button
    private let isFavoriteImage = UIImage(systemName: "heart.fill")
    private let notFavoriteImage = UIImage(systemName: "heart")
    
    var isFavorite: Bool = false {
        didSet {
            configureFavoriteButton()
        }
    }
    
    // MARK: - METHODS
    
    // MARK: - @IBActions
    @IBAction func favoriteButtonTapped(_ sender: UIButton) {
        
    }
    
    // MARK: - Favorite button configuration
    private func configureFavoriteButton() {
        let image = isFavorite ? isFavoriteImage : notFavoriteImage
        favoriteButton.setImage(image, for: .normal)
    }
    
    // MARK: - Resetting values
    private func reset() {
        titleLabel.text = ""
        bodyLabel.text = ""
        isFavorite = false
    }
    
    // MARK: - Life cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        reset()
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        reset()
    }
}
