//
//  MovieDetailsViewModel.swift
//  DecadeOfMovies
//
//  Created by Soufian Hossam on 8/7/20.
//  Copyright © 2020 Soufian Hossam. All rights reserved.
//

import Foundation

protocol MovieDetailsBusinessLogic {
    var movie: Movie { get }
    var imagePaths: [URL?] { get }
    var newDataArrived: (() -> Void)? { set get }
    
    func fetchImages()
}

class MovieDetailsViewModel: MovieDetailsBusinessLogic {
    // Variables
    private var imageSearchManager: ImageSearchable
    private(set) var movie: Movie
    private(set) var imagePaths: [URL?] = [] {
        didSet {
            imagePaths.isEmpty ? nil : newDataArrived?()
        }
    }
    // Closures
    var newDataArrived: (() -> Void)?
    
    init(movie: Movie, imageSearchManager: ImageSearchable = ImageSearchManager()) {
        self.movie = movie
        self.imageSearchManager = imageSearchManager
    }
    
    func fetchImages() {
        imageSearchManager.fetchImages(query: movie.title) { [unowned self] images in
            self.imagePaths = images.map({ $0.imagePath })
        }
    }
}
