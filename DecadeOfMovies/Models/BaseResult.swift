//
//  BaseResult.swift
//  DecadeOfMovies
//
//  Created by Soufian Hossam on 8/7/20.
//  Copyright © 2020 Soufian Hossam. All rights reserved.
//

import ObjectMapper

class BaseResult: Mappable {
    var movies: [Movie] = []
    
    init() { }
    required init?(map: Map) { }
    
    func mapping(map: Map) {
        movies <- map["movies"]
    }
}
