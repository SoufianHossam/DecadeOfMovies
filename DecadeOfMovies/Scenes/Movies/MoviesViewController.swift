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
        viewModel.sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.sections[section].values.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MovieCell.id) as! MovieCell
        cell.titleLabel.text = viewModel.sections[indexPath.section].values[indexPath.row].title
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        viewModel.sections[section].title
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let view = view as? UITableViewHeaderFooterView
        view?.textLabel?.textColor = UIColor.systemBlue
        view?.textLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        view?.textLabel?.text = view?.textLabel?.text?.capitalized
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
