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
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var releaseDate: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    
    var blurEffectView : UIVisualEffectView!
    var favoriteButtonTapped: (() -> Void)?

    func configureCell(_ model: Movie, favoriteButtonTapped: @escaping () -> Void) {
        name.text = model.name
        rate.text = model.rate
        favoriteButton.tintColor = model.isFavorite ? .yellow : .white
        releaseDate.text = model.date
        
        self.favoriteButtonTapped = favoriteButtonTapped

        Task {
            await image.loadImage(from: model.poster)
            await backgroundImage.loadImage(from: model.poster)
        }
    }
    
    @IBAction func favoriteButtonTapped(_ sender: Any) {
        favoriteButtonTapped?()

    }
    
}
