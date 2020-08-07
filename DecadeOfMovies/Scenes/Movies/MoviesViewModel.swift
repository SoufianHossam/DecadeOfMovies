//
//  MoviesViewModel.swift
//  DecadeOfMovies
//
//  Created by Soufian Hossam on 8/7/20.
//  Copyright © 2020 Soufian Hossam. All rights reserved.
//

import Foundation

protocol MoviesBusinessLogic {
    var filteredMovies: [Movie] { get }
    var lastSearchQuery: String { set get }
    var newDataArrived: (() -> Void)? { set get }
    var showNoResults: ((Bool) -> Void)? { set get }
    
    func fetchMovies()
    func search(query: String?)
    func resetFilteredMovies()
}

class MoviesViewModel: MoviesBusinessLogic {
    var lastSearchQuery: String = ""
    private var moviesManager: MoviesFetchable
    private var movies: [Movie] = []
    private(set) var filteredMovies: [Movie] = [] {
        didSet {
            newDataArrived?()
            showNoResults?(!filteredMovies.isEmpty)
            
        }
    }
    // Closures
    var newDataArrived: (() -> Void)?
    var showNoResults: ((Bool) -> Void)?
    
    init(_ moviesManager: MoviesFetchable = MoviesFetcher()) {
        self.moviesManager = moviesManager
    }
    
    // MARK: Functions
    func fetchMovies() {
        movies = moviesManager.getMovies()
        filteredMovies = movies
    }
    
    func resetFilteredMovies() {
        filteredMovies = movies
        lastSearchQuery = ""
    }
    
    func search(query: String?) {
        guard let query = query, !query.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else { return }
        lastSearchQuery = query
        
        filteredMovies = movies.filter({
            $0.title.lowercased().contains(query.lowercased()) ||
            "\($0.year)" == query ||
            "\($0.rating)" == query ||
            $0.cast.joined(separator: " ").lowercased().contains(query.lowercased()) ||
            $0.genres.joined(separator: " ").lowercased().contains(query.lowercased())
        })
    }
    
//    func groupFilteredMoviesByYear() {
//        // Set the flag of search
//        let groupingDictionary = Dictionary(grouping: filteredMovies, by: { $0.year })
//        print(groupingDictionary)
//        let groupingArray = Array(groupingDictionary.values)
//        groupingDictionary.keys
//    }
}
