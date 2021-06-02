//
//  SearchMisicViewController.swift
//  iOSArchitecturesDemo
//
//  Created by  Sergei on 31.05.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

final class SearchMusicViewController: UIViewController {
  private let presenter: SearchMusicViewOutput
  private var searchView: SearchView {
    return self.view as! SearchView
  }
  
  init(presenter: SearchMusicViewOutput) {
    self.presenter = presenter
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func loadView() {
    super.loadView()
    self.view = SearchView()
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    navigationController?.navigationBar.prefersLargeTitles = true
    searchView.searchBar.delegate = self
    searchView.tableView.register(MusicCell.self, forCellReuseIdentifier: MusicCell.description())
    searchView.tableView.delegate = self
    searchView.tableView.dataSource = self
  }
}

//MARK: - UITableViewDataSource

extension SearchMusicViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return presenter.searchResults.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: MusicCell.description(), for: indexPath) as? MusicCell else {
      fatalError("dequeueReusableCell(withIdentifier:) unexpected Index Path")
    }
    let cellModel = presenter.searchResults[indexPath.row]
    cell.configure(with: cellModel)
    return cell
  }
}

//MARK: - UISearchBarDelegate

extension SearchMusicViewController: UISearchBarDelegate {
  func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
    guard let query = searchBar.text,
          !query.isEmpty else {
      searchBar.resignFirstResponder()
      return
    }
    presenter.viewDidSearch(with: query)
  }
}

//MARK: - UITableViewDelegate

extension SearchMusicViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    let cellModel = presenter.searchResults[indexPath.row]
    presenter.viewDidSelect(with: cellModel)
  }
}

// MARK: - Input

extension SearchMusicViewController: SearchMusicViewInput {
  func showError(error: Error) {
    let alert = UIAlertController(title: "Error", message: "\(error.localizedDescription)", preferredStyle: .alert)
    let actionOk = UIAlertAction(title: "OK", style: .cancel, handler: nil)
    alert.addAction(actionOk)
    present(alert, animated: true, completion: nil)
  }
  
  func showNoResults() {
    searchView.emptyResultView.isHidden = false
    searchView.tableView.reloadData()
  }
 
  func showResults() {
    searchView.emptyResultView.isHidden = true
    searchView.tableView.isHidden = false
    searchView.tableView.reloadData()
    searchView.searchBar.resignFirstResponder()
  }
}
