//
//  MoviesFetcherTests.swift
//  MoviesFetcherTests
//
//  Created by Soufian Hossam on 8/7/20.
//  Copyright © 2020 Soufian Hossam. All rights reserved.
//

import XCTest
@testable import DecadeOfMovies

class MoviesFetcherTests: XCTestCase {

    var bundleParser: BundleParsable!
    
    override func setUp() {
        let bundle = Bundle(for: type(of: self))
        bundleParser = BundleParser(bundle: bundle)
    }

    func testInvalidFilePathBundleParser() {
        XCTAssertThrowsError(try bundleParser.parse(fileName: "inValidMovies", ofType: "json")) { error in
            XCTAssertEqual(error as! BundleParsingError, BundleParsingError.pathNotFound)
        }
    }
    
    func testValidFilePathBundleParser() {
        let data = try! bundleParser.parse(fileName: "ValidMovies", ofType: "json")
        XCTAssertNotEqual(data.count, 0)
    }
    
    func testMovieFetcherValidData() {
        let moviesFetcher = MoviesFetcher(bundleParser: BundleParserStub(shouldSucceed: true))
        let movies = moviesFetcher.getMovies()
        XCTAssertEqual(movies.count, 4)
    }
    
    func testMovieFetcherInvalidData() {
        let moviesFetcher = MoviesFetcher(bundleParser: BundleParserStub(shouldSucceed: false))
        let movies = moviesFetcher.getMovies()
        XCTAssertEqual(movies.count, 0)
    }
}
