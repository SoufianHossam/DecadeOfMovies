//
//  NetworkManager.swift
//  DecadeOfMovies
//
//  Created by Soufian Hossam on 8/7/20.
//  Copyright © 2020 Soufian Hossam. All rights reserved.
//

import Alamofire
import ObjectMapper

protocol ImageSearchable {
    func fetchImages(query: String, completion: @escaping ([FlickerImage]) -> Void)
}

class ImageSearchManager: ImageSearchable {
    // Here we won't be using "Result<[FlickerImage], Error>" cause if the api fails no error should
    // be visible to the user, I think it will be bad user experience. So i will use plain old empty array instead :D
    func fetchImages(query: String, completion: @escaping ([FlickerImage]) -> Void) {
        AF.request(URLs.flickrPhotoSearch + query).responseJSON { response in
            switch response.result {
            case .success(let result):
                guard let json = result as? [String: Any] else { return completion([]) }
                guard let flickrResponse = Mapper<FlickrResponse>().map(JSON: json) else { return completion([]) }
                completion(flickrResponse.photos.photo)
                
            case .failure(let error):
                print(error.localizedDescription)
                completion([])
            }
        }
    }
}
