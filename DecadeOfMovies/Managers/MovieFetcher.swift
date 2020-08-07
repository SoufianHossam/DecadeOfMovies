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
    
    func getMovies() -> [Movie] {
        guard let path = Bundle.main.path(forResource: "movies", ofType: "json") else { return [] }
        let url = URL(fileURLWithPath: path)
        
        do {
            let data = try Data(contentsOf: url)
            guard let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] else { return [] }
            
            let result = Mapper<BaseResult>().map(JSON: json)
            return result?.movies ?? []
        }
        catch {
            return []
        }
    }
}
