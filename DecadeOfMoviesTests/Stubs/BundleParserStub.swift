//
//  BundleParserStub.swift
//  MoviesFetcherTests
//
//  Created by Soufian Hossam on 8/8/20.
//  Copyright © 2020 Soufian Hossam. All rights reserved.
//

import Foundation
@testable import DecadeOfMovies

public class BundleParserStub: BundleParsable {
    private var shouldSucceed: Bool
    
    init(shouldSucceed: Bool) {
        self.shouldSucceed = shouldSucceed
    }
    
    public func parse(fileName: String, ofType: String) throws -> Data {
        let data: Data
        
        if shouldSucceed {
            let baseResult = BaseResult()
            baseResult.movies = [Movie(), Movie(), Movie(), Movie()]
            data = baseResult.toJSONString()!.data(using: .utf8) ?? Data()
            
        } else {
            data = "".data(using: .utf8) ?? Data()
        }
        
        return data
    }
}
