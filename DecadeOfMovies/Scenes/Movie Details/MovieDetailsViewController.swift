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
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: Variables
    var viewModel: MovieDetailsBusinessLogic!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Details"

        fillUI()
        setupBindings()
        
        viewModel.fetchImages()
    }

    // MARK: Functions
    func fillUI() {
        titleLabel.text = viewModel.movie.title
        yearLabel.text = "\(viewModel.movie.year)"
        genreLabel.text = viewModel.movie.genres.joined(separator: ", ")
        castLabel.text = viewModel.movie.cast.joined(separator: ", ")
    }
    
    func setupBindings() {
        viewModel.newDataArrived = { [unowned self] in
            self.collectionView.reloadData()
            NSLayoutConstraint.activate([
                self.collectionView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 1)
            ])
        }
    }
}

extension MovieDetailsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.imagePaths.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MoviePhotoCell.id, for: indexPath) as! MoviePhotoCell
        cell.moviePhotoImageView.sd_setImage(with: viewModel.imagePaths[indexPath.row], placeholderImage: #imageLiteral(resourceName: "clapperboard"))
        return cell
    }
}

extension MovieDetailsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.size.width / 2, height: collectionView.frame.size.width / 2)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
}
