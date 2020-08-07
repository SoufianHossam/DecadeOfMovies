//
//  MovieSection.swift
//  DecadeOfMovies
//
//  Created by Soufian Hossam on 8/7/20.
//  Copyright © 2020 Soufian Hossam. All rights reserved.
//

import Foundation

class MovieSection {
    var title: String = ""
    var values: [Movie] = []
    
    init(title: String = "", values: [Movie] = []) {
        self.title = title
        self.values = values
    }
}

extension MovieSection {
    static func > (lhs: MovieSection, rhs: MovieSection) -> Bool {
        lhs.values.first?.year ?? 0 > rhs.values.first?.year ?? 0
    }
}
