//
//  URLs.swift
//  DecadeOfMovies
//
//  Created by Soufian Hossam on 8/7/20.
//  Copyright © 2020 Soufian Hossam. All rights reserved.
//

import Foundation

enum URLs {
    static let flickrPhotoSearch = "https://www.flickr.com/services/rest/?method=flickr.photos.search&api_key=\(FlickrKeys.apiKey)&format=json&nojsoncallback=1&per_page=25&text="
    static let imagePath = "https://farm%d.staticflickr.com/%@/%@_%@.jpg"
}
