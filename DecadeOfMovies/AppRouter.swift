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
        moviesVC.router = MoviesRouter(moviesVC)
        
        let nc = UINavigationController(rootViewController: moviesVC)
        nc.navigationBar.isTranslucent = false
        nc.navigationBar.tintColor = .white
        nc.navigationBar.barStyle = .black
        nc.navigationBar.barTintColor = #colorLiteral(red: 0.1085461576, green: 0.109620872, blue: 0.109620872, alpha: 1)
        
        window?.rootViewController = nc
        window?.makeKeyAndVisible()
    }
}
