//
//  MoviesRouter.swift
//  DecadeOfMovies
//
//  Created by Soufian Hossam on 8/7/20.
//  Copyright © 2020 Soufian Hossam. All rights reserved.
//

import UIKit

protocol MoviesRoutable {
    var viewController: UIViewController? { set get }
    func navigateToMovieDetails(_ movie: Movie)
}

class MoviesRouter: MoviesRoutable {
    weak var viewController: UIViewController?
    
    init(_ viewController: UIViewController) {
        self.viewController = viewController
    }
    
    func navigateToMovieDetails(_ movie: Movie) {
        let vc = MovieDetailsViewController.instance
        vc.viewModel = MovieDetailsViewModel(movie: movie)
        viewController?.navigationController?.pushViewController(vc, animated: true)
    }
}
