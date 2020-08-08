//
//  MoviesFetcher.swift
//  DecadeOfMovies
//
//  Created by Soufian Hossam on 8/7/20.
//  Copyright © 2020 Soufian Hossam. All rights reserved.
//

import Foundation
import ObjectMapper

protocol MoviesFetchable {
    func getMovies() -> [Movie]
}

class MoviesFetcher: MoviesFetchable {
    var bundleParser: BundleParsable
    
    init(bundleParser: BundleParsable = BundleParser()) {
        self.bundleParser = bundleParser
    }
    
    func getMovies() -> [Movie] {
        do {
            let data = try bundleParser.parse(fileName: "movies", ofType: "json")
            
            guard let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] else {
                return []
            }
            
            let result = Mapper<BaseResult>().map(JSON: json)
            
            return result?.movies ?? []
        }
        catch {
            return []
        }
    }
}
