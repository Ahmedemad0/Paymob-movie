//
//  MoviesListRouter.swift
//  PaymobMovie
//
//  Created by Ahmed Emad on 07/07/2024.
//

import UIKit

protocol MoviesListRouterProtocol {
    static func createScene() -> UIViewController
    func navigateTo(destination: MoviesListRouterDestinations, fromViewController viewController: MoviesListViewController)
}

enum MoviesListRouterDestinations {
    case movieDetails
}

class MoviesListRouter : MoviesListRouterProtocol {
   
    static func createScene() -> UIViewController {
        let router = MoviesListRouter()
        let viewController = MoviesListViewController(router: router)
        
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.modalPresentationStyle = .fullScreen
        navigationController.isNavigationBarHidden = true

        return navigationController
    }
    
    func navigateTo(destination: MoviesListRouterDestinations, fromViewController viewController: MoviesListViewController) {
        switch destination {
        case .movieDetails:
            navigateToMovieDetailsScreen(fromView: viewController)
        }
    }
    
    private func navigateToMovieDetailsScreen(fromView viewController: MoviesListViewController){
        let destinationViewController = MovieDetailsRouter.createScene()
        viewController.navigationController?.pushViewController(destinationViewController, animated: true)
    }
}
