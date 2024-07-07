//
//  MovieCollectionViewCell.swift
//  PaymobMovie
//
//  Created by Ahmed Emad on 07/07/2024.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var rate: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    
    
    func configureCell(_ model: Movie) {
        name.text = model.name
        rate.text = model.rate
        favoriteButton.tintColor = model.isFavorite ? .yellow : .white
    }

    @IBAction func favoriteButtonTapped(_ sender: Any) {
        print("Favorite")
    }
}
