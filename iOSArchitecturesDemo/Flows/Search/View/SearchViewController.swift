//
//  ViewController.swift
//  iOSArchitecturesDemo
//
//  Created by ekireev on 14.02.2018.
//  Copyright © 2018 ekireev. All rights reserved.
//

import UIKit

final class SearchViewController: UIViewController {
  
  // MARK: - Private Properties
  
  private let presenter: SearchViewOutput
  private var searchView: SearchView {
    return self.view as! SearchView
  }

  // MARK: - Public Properties
  
  var searchResults = [ITunesApp]() {
    didSet {
      searchView.tableView.isHidden = false
      searchView.tableView.reloadData()
      searchView.searchBar.resignFirstResponder()
    }
  }
  
  init(presenter: SearchViewOutput) {
    self.presenter = presenter
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - Lifecycle
  
  override func loadView() {
    super.loadView()
    self.view = SearchView()
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    navigationController?.navigationBar.prefersLargeTitles = true
    searchView.searchBar.delegate = self
    searchView.tableView.register(AppCell.self, forCellReuseIdentifier: AppCell.description())
    searchView.tableView.delegate = self
    searchView.tableView.dataSource = self
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
  }
}

//MARK: - UITableViewDataSource

extension SearchViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return searchResults.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: AppCell.description(), for: indexPath) as? AppCell else {
      fatalError("dequeueReusableCell(withIdentifier:) unexpected Index Path")
    }
    let app = searchResults[indexPath.row]
    let cellModel = AppCellModelFactory.cellModel(from: app)
    cell.configure(with: cellModel)
    return cell
  }
}

//MARK: - UITableViewDelegate

extension SearchViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    let app = searchResults[indexPath.row]
    presenter.viewDidSelectApp(app)
  }
}

//MARK: - UISearchBarDelegate

extension SearchViewController: UISearchBarDelegate {
  func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
    guard let query = searchBar.text,
          !query.isEmpty else {
      searchBar.resignFirstResponder()
      return
    }
    presenter.viewDidSearch(with: query)
  }
}

// MARK: - Input

extension SearchViewController: SearchViewInput {
  func showError(error: Error) {
    let alert = UIAlertController(title: "Error", message: "\(error.localizedDescription)", preferredStyle: .alert)
    let actionOk = UIAlertAction(title: "OK", style: .cancel, handler: nil)
    alert.addAction(actionOk)
    present(alert, animated: true, completion: nil)
  }
  
  func showNoResults() {
    searchView.emptyResultView.isHidden = false
    searchResults = []
    searchView.tableView.reloadData()
  }
  
  func hideNoResults() {
    searchView.emptyResultView.isHidden = true
  }
}
