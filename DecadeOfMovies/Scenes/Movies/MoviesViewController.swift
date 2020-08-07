//
//  MoviesViewController.swift
//  DecadeOfMovies
//
//  Created by Soufian Hossam on 8/7/20.
//  Copyright © 2020 Soufian Hossam. All rights reserved.
//

import UIKit

class MoviesViewController: UIViewController {
    // MARK: IBOutlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var noResultsImageView: UIImageView!
    
    // MARK: Variables
    var viewModel: MoviesBusinessLogic!
    var searchController: UISearchController!
    
    // MARK: View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Movies"
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.tableFooterView = UIView()
        
        setupBindings()
        setupSearchController()
        setupBarButtonItem()
        
        viewModel.fetchMovies()
    }
    
    // MARK: Functions
    func setupBindings() {
        viewModel.newDataArrived = { [unowned self] in
            self.tableView.reloadData()
        }
        
        viewModel.showNoResults = { [unowned self] isHidden in
            self.noResultsImageView.isHidden = isHidden
        }
    }
    
    func setupBarButtonItem() {
        let searchBarButton = UIBarButtonItem(image: #imageLiteral(resourceName: "search"), style: .plain, target: self, action: #selector(didTapOnSearchButton))
        navigationItem.rightBarButtonItems = [searchBarButton]
    }
    
    @objc func didTapOnSearchButton() {
        searchController.searchBar.text = viewModel.lastSearchQuery
        present(searchController, animated: true)
    }
}

extension MoviesViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.filteredMovies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MovieCell.id) as! MovieCell
        cell.titleLabel.text = viewModel.filteredMovies[indexPath.row].title
        return cell
    }
}

extension MoviesViewController: UISearchBarDelegate {
    func setupSearchController() {
        // Create the search controller and specify that it should present its results in this same view
        searchController = UISearchController(searchResultsController: nil)
        searchController.hidesNavigationBarDuringPresentation = false
        
        searchController.searchBar.barTintColor = UIColor.white
        searchController.searchBar.tintColor = #colorLiteral(red: 0.1085461576, green: 0.109620872, blue: 0.109620872, alpha: 1)
        
        searchController.searchBar.delegate = self
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.search(query: searchBar.text)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchController.dismiss(animated: true)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        viewModel.resetFilteredMovies()
    }
}
