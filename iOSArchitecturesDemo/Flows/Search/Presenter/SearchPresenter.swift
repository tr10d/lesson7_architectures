//
//  SearchPresenter.swift
//  iOSArchitecturesDemo
//
//  Created by  Sergei on 31.05.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

final class SearchPresenter {
    weak var viewInput: (UIViewController & SearchViewInput)?
    private let searchService = ITunesSearchService()
    
    private func requestApps(with query: String) {
      searchService.getApps(forQuery: query) { [weak self] result in
        guard let self = self else { return }
        switch result {
        case .success(let apps):
          guard !apps.isEmpty else {
            self.viewInput?.showNoResults()
            return
          }
          self.viewInput?.hideNoResults()
          self.viewInput?.searchResults = apps
        case .failure(let error):
          self.viewInput?.showError(error: error)
        }
      }
    }
    
    private func openAppDetails(with app: ITunesApp) {
        let appDetaillViewController = AppDetailViewController(app: app)
        self.viewInput?.navigationController?.pushViewController(appDetaillViewController, animated: true)
    }
}

// MARK: - SearchViewOutput

extension SearchPresenter: SearchViewOutput {
    func viewDidSearch(with query: String) {
        requestApps(with: query)
    }
    
    func viewDidSelectApp(_ app: ITunesApp) {
        openAppDetails(with: app)
    }
}
