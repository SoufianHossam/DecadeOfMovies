//
//  String + Extensions.swift
//  DecadeOfMovies
//
//  Created by Soufian Hossam on 8/8/20.
//  Copyright © 2020 Soufian Hossam. All rights reserved.
//

import Foundation

extension String {
    var urlEncoded: String {
        self.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? self
    }
}
