//
//  FlickrResponse.swift
//  DecadeOfMovies
//
//  Created by Soufian Hossam on 8/7/20.
//  Copyright © 2020 Soufian Hossam. All rights reserved.
//

import ObjectMapper

class FlickrResponse: Mappable {
    var photos: Photo = Photo()
    
    required init?(map: Map) { }
    
    func mapping(map: Map) {
        photos <- map["photos"]
    }
}

class Photo: Mappable {
    var page: Int = 0
    var pages: Int = 0
    var photo: [FlickerImage] = []
    
    init() { }
    required init?(map: Map) { }
    
    func mapping(map: Map) {
        page <- map["page"]
        pages <- map["pages"]
        photo <- map["photo"]
    }
}
