//
//  MoviesListViewController.swift
//  PaymobMovie
//
//  Created by Ahmed Emad on 07/07/2024.
//

import UIKit

class MoviesListViewController: UIViewController {
    
    // collection view to display the movies.
    @IBOutlet weak var collectionView: UICollectionView!
    
    // The view model that holds UI logic.
    let viewModel: MoviesListViewModel
    // custom data source and delegate for the collection view.
    private var dataSources: MoviesListCollectionViewDataSources?

    // Initializer with a default view model
    init(viewModel: MoviesListViewModel = MoviesListViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: "MoviesListViewController", bundle: nil)
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
    
}


