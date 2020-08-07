//
//  MoviesViewController.swift
//  DecadeOfMovies
//
//  Created by Soufian Hossam on 8/7/20.
//  Copyright © 2020 Soufian Hossam. All rights reserved.
//

import UIKit

class MoviesViewController: UIViewController {
    // MARK: IBOutlets
    
    // MARK: Variables
    var viewModel: MoviesBusinessLogic!
    
    // MARK: View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBindings()
        viewModel.fetchMovies()
    }
    
    // MARK: Functions
    func setupBindings() {
        viewModel.newDataArrived = { [unowned self] in
            print(self.viewModel.movies)
        }
    }
}
