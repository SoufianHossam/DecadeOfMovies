//
//  AppRouter.swift
//  DecadeOfMovies
//
//  Created by Soufian Hossam on 8/7/20.
//  Copyright © 2020 Soufian Hossam. All rights reserved.
//

import UIKit

protocol AppRoutable {
    func initLandingPage(window: inout UIWindow?)
}

class AppRouter: AppRoutable {
    
    func initLandingPage(window: inout UIWindow?) {
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let moviesVC = MoviesViewController.instance
        moviesVC.viewModel = MoviesViewModel()
        
        window?.rootViewController = UINavigationController(rootViewController: moviesVC)
        window?.makeKeyAndVisible()
    }
}
