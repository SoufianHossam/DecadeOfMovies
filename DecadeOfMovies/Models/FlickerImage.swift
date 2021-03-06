//
//  FlickerImage.swift
//  DecadeOfMovies
//
//  Created by Soufian Hossam on 8/7/20.
//  Copyright © 2020 Soufian Hossam. All rights reserved.
//

import ObjectMapper

class FlickerImage: Mappable {
    var id: String = ""
    var secret: String = ""
    var server: String = ""
    var farm: Int = 0
    var title: String = ""
    var imagePath: URL? {
        let urlString = String(format: URLs.imagePath, farm, server, id, secret)
        return URL(string: urlString)
    }
    
    required init?(map: Map) { }
    
    func mapping(map: Map) {
        id <- map["id"]
        secret <- map["secret"]
        server <- map["server"]
        farm <- map["farm"]
        title <- map["title"]
    }
}
