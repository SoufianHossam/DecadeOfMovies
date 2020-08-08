//
//  MoviesViewModelTests.swift
//  DecadeOfMoviesTests
//
//  Created by Soufian Hossam on 8/8/20.
//  Copyright © 2020 Soufian Hossam. All rights reserved.
//

import XCTest
@testable import DecadeOfMovies

class MoviesViewModelTests: XCTestCase {
    // Here i should've put "moviesViewModel" at class scope so i don't repeat
    // the initialization on each and every test, but that means i should inject
    // "moviesFetcherStub" using property injection which is not possible due to
    // private access modifier on that property.
    func testFetchMoviesReturnsList() {
        let moviesFetcher = MoviesFetcherStub(shouldSucceed: true)
        let moviesViewModel = MoviesViewModel(moviesFetcher)
        
        moviesViewModel.fetchMovies()
        XCTAssertEqual(moviesViewModel.sections.count, 1)
        XCTAssertEqual(moviesViewModel.sections.first!.values.count, 6)
    }
    
    func testFetchMoviesReturnsNothing() {
        let moviesFetcher = MoviesFetcherStub(shouldSucceed: false)
        let moviesViewModel = MoviesViewModel(moviesFetcher)
        
        moviesViewModel.fetchMovies()
        XCTAssertEqual(moviesViewModel.sections.count, 1)
        XCTAssertEqual(moviesViewModel.sections.first!.values.count, 0)

    }
    
    func testResetFilteredMovies() {
        let moviesFetcher = MoviesFetcherStub(shouldSucceed: true)
        let moviesViewModel = MoviesViewModel(moviesFetcher)
        
        moviesViewModel.fetchMovies()
        moviesViewModel.resetFilteredMovies()
        
        XCTAssertEqual(moviesViewModel.sections.count, 1)
        XCTAssertEqual(moviesViewModel.sections.first!.values.count, 6)
        
        XCTAssertTrue(moviesViewModel.lastSearchQuery.isEmpty)
    }
    
    func testFormatFilteredMovies() {
        let moviesFetcher = MoviesFetcherStub(shouldSucceed: true)
        let moviesViewModel = MoviesViewModel(moviesFetcher)
        
        moviesViewModel.formatFilteredMovies(moviesFetcher.getMovies())
        
        XCTAssertEqual(moviesViewModel.sections.count, 4)
        
        XCTAssertEqual(moviesViewModel.sections[0].title, "Year 2010")
        XCTAssertEqual(moviesViewModel.sections[0].values.count, 2)
        
        XCTAssertEqual(moviesViewModel.sections[1].title, "Year 2000")
        XCTAssertEqual(moviesViewModel.sections[1].values.count, 1)

        XCTAssertEqual(moviesViewModel.sections[2].title, "Year 1985")
        XCTAssertEqual(moviesViewModel.sections[2].values.count, 1)
        
        XCTAssertEqual(moviesViewModel.sections[3].title, "Year 1975")
        XCTAssertEqual(moviesViewModel.sections[3].values.count, 2)
    }
    
    func testSearchByTitle() {
        let moviesFetcher = MoviesFetcherStub(shouldSucceed: true)
        let moviesViewModel = MoviesViewModel(moviesFetcher)
        
        moviesViewModel.fetchMovies()
        moviesViewModel.search(query: "the ")
        
        XCTAssertEqual(moviesViewModel.sections.count, 1)
        XCTAssertEqual(moviesViewModel.sections[0].values.count, 2)
        
        moviesViewModel.resetFilteredMovies()
        moviesViewModel.search(query: "  12 ")

        XCTAssertEqual(moviesViewModel.sections.count, 2)
        XCTAssertEqual(moviesViewModel.sections[0].values.count, 1)
        XCTAssertEqual(moviesViewModel.sections[1].values.count, 1)
    }
    
    func testSearchByYear() {
        let moviesFetcher = MoviesFetcherStub(shouldSucceed: true)
        let moviesViewModel = MoviesViewModel(moviesFetcher)
        
        moviesViewModel.fetchMovies()
        moviesViewModel.search(query: "1985")

        XCTAssertEqual(moviesViewModel.sections.count, 1)
        XCTAssertEqual(moviesViewModel.sections[0].values.count, 1)
    }
}
