//
//  StoryboardInitializer.swift
//  MyPayTabs
//
//  Created by Soufian Hossam on 6/18/20.
//  Copyright © 2020 Soufian Hossam. All rights reserved.
//

import UIKit

protocol StoryboardInitializer: class { }

extension StoryboardInitializer where Self: UIViewController {
    static var instance: Self {
        return UIStoryboard(name: self.id, bundle: nil).instantiateInitialViewController() as! Self
    }
}

extension UIViewController: StoryboardInitializer, Identifiable { }
