//
//  MoviesViewModel.swift
//  DecadeOfMovies
//
//  Created by Soufian Hossam on 8/7/20.
//  Copyright © 2020 Soufian Hossam. All rights reserved.
//

import Foundation

protocol MoviesBusinessLogic {
    var sections: [MovieSection] { get }
    var lastSearchQuery: String { set get }
    var newDataArrived: (() -> Void)? { set get }
    var showNoResults: ((Bool) -> Void)? { set get }
    
    func fetchMovies()
    func search(query: String?)
    func resetFilteredMovies()
}

class MoviesViewModel: MoviesBusinessLogic {
    // Variabels
    var lastSearchQuery: String = ""
    private var moviesManager: MoviesFetchable
    private var movies: [Movie] = []
    private(set) var sections: [MovieSection] = [] {
        didSet {
            newDataArrived?()
            showNoResults?(!sections.isEmpty)
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
        sections = [MovieSection(values: movies)]
    }
    
    func resetFilteredMovies() {
        sections = [MovieSection(values: movies)]
        lastSearchQuery = ""
    }
    
    func search(query: String?) {
        guard let query = query, !query.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else { return }
        lastSearchQuery = query
        
        let filteredMovies = movies.filter({
            $0.title.lowercased().contains(query.lowercased()) ||
            "\($0.year)" == query ||
            "\($0.rating)" == query ||
            $0.cast.joined(separator: " ").lowercased().contains(query.lowercased()) ||
            $0.genres.joined(separator: " ").lowercased().contains(query.lowercased())
        })
        
        formatFilteredMovies(filteredMovies)
    }
    
    func formatFilteredMovies(_ movies: [Movie]) {
        let groupedMoviesByYear = Dictionary(grouping: movies, by: { $0.year })
        
        sections = groupedMoviesByYear
            .map({ group in
                let section = MovieSection()
                section.title = "Year \(group.key)"
                section.values = Array(group.value.sorted(by: >).prefix(5))
                return section
            })
            .sorted(by: >)
    }
}
