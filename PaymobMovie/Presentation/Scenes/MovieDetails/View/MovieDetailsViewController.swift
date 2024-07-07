//
//  MovieDetailsViewController.swift
//  PaymobMovie
//
//  Created by Ahmed Emad on 07/07/2024.
//

import UIKit
import Combine

class MovieDetailsViewController: UIViewController {
    
    
    @IBOutlet weak var poster: UIImageView!
    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var describtion: UILabel!
    @IBOutlet weak var rate: UILabel!
    @IBOutlet weak var name: UILabel!
    
    private var cancellables = Set<AnyCancellable>()

    let router: MovieDetailsRouterProtocol
    let viewModel: MovieDetailsViewModel
    
    init(router: MovieDetailsRouterProtocol, viewModel: MovieDetailsViewModel) {
        self.router = router
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.viewDidLoad()
        bindGetMoviesListViewModel()
    }
    
    private func setMovieDetails(model: MovieDetails) {
        name.text = model.name
        describtion.text = model.overView
        rate.text = model.rate
        favoriteButton.tintColor = model.isFavorite ? .yellow : .white
    }
    
    func bindGetMoviesListViewModel() {
        viewModel.$movie
                .receive(on: DispatchQueue.main)
                .sink { [weak self] movie in
                    guard let self else { return }
                    guard let movie else { return }
                    self.setMovieDetails(model: movie)
                }
                .store(in: &cancellables)
    }
    
    
    @IBAction func favoriteButtonTapped(_ sender: Any) {
        viewModel.toggleFavoriteStatus()
    }

}
