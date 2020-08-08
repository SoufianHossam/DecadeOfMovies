//
//  MoviesFetcherStub.swift
//  DecadeOfMoviesTests
//
//  Created by Soufian Hossam on 8/8/20.
//  Copyright © 2020 Soufian Hossam. All rights reserved.
//

import Foundation
@testable import DecadeOfMovies

public class MoviesFetcherStub: MoviesFetchable {
    private var shouldSucceed: Bool
    
    init(shouldSucceed: Bool) {
        self.shouldSucceed = shouldSucceed
    }
    
    public func getMovies() -> [Movie] {
        let movies = [Movie(title: "12 Angrey Men", year: 1975, rating: 5),
                      Movie(title: "Bird man", year: 2000, rating: 2),
                      Movie(title: "The Hobbit", year: 2010, rating: 4),
                      Movie(title: "The Greate Escape", year: 2010, rating: 2),
                      Movie(title: "12 Steps", year: 1985, rating: 1),
                      Movie(title: "A Fistful Of Dollars", year: 1975, rating: 1)]
        return shouldSucceed ? movies : []
    }
}
