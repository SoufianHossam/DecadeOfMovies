//
//  BundleParser.swift
//  DecadeOfMovies
//
//  Created by Soufian Hossam on 8/8/20.
//  Copyright © 2020 Soufian Hossam. All rights reserved.
//

import Foundation

public protocol BundleParsable {
    func parse(fileName: String, ofType: String) throws -> Data
}

class BundleParser: BundleParsable {
    private var bundle: Bundle
    
    init(bundle: Bundle = .main) {
        self.bundle = bundle
    }
    
    func parse(fileName: String, ofType: String) throws -> Data {
        guard let path = bundle.path(forResource: fileName, ofType: ofType) else {
            throw BundleParsingError.pathNotFound
        }
        
        let url = URL(fileURLWithPath: path)
        
        do {
            return try Data(contentsOf: url)
        }
        catch {
            throw BundleParsingError.fileToDataConversionFailed
        }
    }
}

enum BundleParsingError: Error {
    case pathNotFound
    case fileToDataConversionFailed
}
