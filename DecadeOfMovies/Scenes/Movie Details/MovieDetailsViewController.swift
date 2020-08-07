//
//  MovieDetailsViewController.swift
//  DecadeOfMovies
//
//  Created by Soufian Hossam on 8/7/20.
//  Copyright © 2020 Soufian Hossam. All rights reserved.
//

import UIKit
import SDWebImage

class MovieDetailsViewController: UIViewController {
    // MARK: IBOutlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var castLabel: UILabel!
    
    // MARK: Variables
    var viewModel: MovieDetailsBusinessLogic!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Details"
        fillUI()
    }

    // MARK: Functions
    func fillUI() {
        titleLabel.text = viewModel.movie.title
        yearLabel.text = "\(viewModel.movie.year)"
        genreLabel.text = viewModel.movie.genres.joined(separator: ", ")
        castLabel.text = viewModel.movie.cast.joined(separator: ", ")
    }
}
