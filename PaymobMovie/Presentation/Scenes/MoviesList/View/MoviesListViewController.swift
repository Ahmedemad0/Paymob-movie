//
//  MoviesListViewController.swift
//  PaymobMovie
//
//  Created by Ahmed Emad on 07/07/2024.
//

import UIKit
import Combine

class MoviesListViewController: UIViewController {
    
    // collection view to display the movies.
    @IBOutlet weak var collectionView: UICollectionView!
    
    let router: MoviesListRouterProtocol
    // The view model that holds UI logic.
    let viewModel: MoviesListViewModel
    // custom data source and delegate for the collection view.
    private var dataSources: MoviesListCollectionViewDataSources?

    private var cancellables: Set<AnyCancellable> = []

    
    // Initializer with a default view model
    init(viewModel: MoviesListViewModel = MoviesListViewModel(), router: MoviesListRouterProtocol) {
        self.viewModel = viewModel
        self.router = router
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Notify the view model that the view has loaded.
        viewModel.viewDidLoad()
        registerCell()
        // Initialize the data source with the view model.
        self.dataSources = .init(viewModel)
        setCollectionViewDelegtes()
        subscribeSelectIndex()
        bindGetMoviesListViewModel()
    }
    
    // Register the custom cell with the collection view.
    private func registerCell(){
        collectionView.register(cells: [MovieCollectionViewCell.self])
    }
    // Set the collection view's data source and delegate.
    func setCollectionViewDelegtes() {
        collectionView.dataSource = dataSources
        collectionView.delegate = dataSources
    }
    
    func bindGetMoviesListViewModel() {
        viewModel.$movies
                .receive(on: DispatchQueue.main)
                .sink { [weak self] _ in
                    guard let self else { return }
                    self.collectionView.reloadData()
                }
                .store(in: &cancellables)
    }
    
    func subscribeSelectIndex() {
        viewModel.movieSelectedPublisher
        .sink { [weak self] index in
            guard let self else { return }
            self.navigateIntoDetails(at: index)
        }
        .store(in: &cancellables)
    }
    
    func navigateIntoDetails(at index: Int) {
        let movie = viewModel.movies[index]
        router.navigateTo(destination: .movieDetails(movie.id, movie.isFavorite), fromViewController: self)
    }
}


