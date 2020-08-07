//
//  Identifiable.swift
//  MyPayTabs
//
//  Created by Soufian Hossam on 6/18/20.
//  Copyright © 2020 Soufian Hossam. All rights reserved.
//

import Foundation

protocol Identifiable {
    static var id: String { get }
}

extension Identifiable {
    static var id: String {
        return String(describing: self)
    }
}

