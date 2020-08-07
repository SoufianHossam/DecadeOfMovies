//
//  MovieDetailsViewModel.swift
//  DecadeOfMovies
//
//  Created by Soufian Hossam on 8/7/20.
//  Copyright © 2020 Soufian Hossam. All rights reserved.
//

import Foundation

protocol MovieDetailsBusinessLogic {
    var movie: Movie { get set }
    var imageSearchManager: ImageSearchable { get set }
    var newDataArrived: (() -> Void)? { set get }
    
    func fetchImages()
}

class MovieDetailsViewModel: MovieDetailsBusinessLogic {
    var movie: Movie
    var imageSearchManager: ImageSearchable
    var newDataArrived: (() -> Void)?
    
    init(movie: Movie, imageSearchManager: ImageSearchable = ImageSearchManager()) {
        self.movie = movie
        self.imageSearchManager = imageSearchManager
    }
    
    func fetchImages() {
        
    }
}
