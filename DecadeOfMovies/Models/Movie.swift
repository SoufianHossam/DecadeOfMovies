//
//  Movie.swift
//  DecadeOfMovies
//
//  Created by Soufian Hossam on 8/7/20.
//  Copyright © 2020 Soufian Hossam. All rights reserved.
//

import ObjectMapper

class Movie: Mappable {
    var title: String = ""
    var year: Int = 0
    var cast: [String] = []
    var genres: [String] = []
    var rating: Int = 0
    
    init() { }
    required init?(map: Map) { }
    
    func mapping(map: Map) {
        title <- map["title"]
        year <- map["year"]
        cast <- map["cast"]
        genres <- map["genres"]
        rating <- map["rating"]
    }
}

extension Movie: CustomStringConvertible {
    var description: String {
        "Title: \(title)\nYear: \(year)\nCast: \(cast)\nGenres: \(genres)\nRating: \(rating)"
    }
}

extension Movie {
    static func > (lhs: Movie, rhs: Movie) -> Bool {
        lhs.year > rhs.year
    }
}
