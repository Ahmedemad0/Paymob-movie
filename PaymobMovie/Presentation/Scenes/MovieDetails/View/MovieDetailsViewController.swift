//
//  MovieDetailsViewController.swift
//  PaymobMovie
//
//  Created by Ahmed Emad on 07/07/2024.
//

import UIKit

class MovieDetailsViewController: UIViewController {
    
    
    @IBOutlet weak var poster: UIImageView!
    
    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var describtion: UILabel!
    @IBOutlet weak var rate: UILabel!
    @IBOutlet weak var name: UILabel!
    
    
    let router: MovieDetailsRouterProtocol
    
    init(router: MovieDetailsRouterProtocol) {
        self.router = router
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    private func setMovieDetails(model: MovieDetails) {
        name.text = model.name
        describtion.text = model.describtion
        rate.text = model.rate
        favoriteButton.tintColor = model.isFavorite ? .yellow : .white
    }

}
