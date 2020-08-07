//
//  MoviesViewModel.swift
//  DecadeOfMovies
//
//  Created by Soufian Hossam on 8/7/20.
//  Copyright © 2020 Soufian Hossam. All rights reserved.
//

import Foundation

protocol MoviesBusinessLogic {
    var movies: [Movie] { get }
    var newDataArrived: (() -> Void)? { set get }
    
    func fetchMovies()
}

class MoviesViewModel: MoviesBusinessLogic {
    // Variables
    private var moviesManager: MoviesFetchable
    private(set) var movies: [Movie] = [] {
        didSet {
            newDataArrived?()
        }
    }
    // Closures
    var newDataArrived: (() -> Void)?
    
    init(_ moviesManager: MoviesFetchable = MoviesFetcher()) {
        self.moviesManager = moviesManager
    }
    
    func fetchMovies() {
        movies = moviesManager.getMovies()
    }
}
