//
//  SearchMusicPresenter.swift
//  iOSArchitecturesDemo
//
//  Created by  Sergei on 31.05.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

final class SearchMusicPresenter {
  weak var viewInput: (UIViewController & SearchMusicViewInput)?
  private let searchService = ITunesSearchService()
  
  var searchResults = [SongCellModel]()
  
  private func requestSongs(with query: String) {
    searchService.getSongs(forQuery: query) { [weak self] result in
      guard let self = self else { return }
      switch result {
      case .success(let songs):
        guard !songs.isEmpty else {
          self.searchResults = []
          self.viewInput?.showNoResults()
          return
        }
        self.searchResults = songs.map { SongCellModelFactory.cellModel(from: $0) }
        self.viewInput?.showResults()
      case .failure(let error):
        self.viewInput?.showError(error: error)
      }
    }
  }
  
  private func openSongDetails(with song: SongCellModel) {
    viewInput?.navigationController?.pushViewController(AppFactory.SongDetailVC(), animated: true)
  }
}

// MARK: - SearchMusicViewOutput

extension SearchMusicPresenter: SearchMusicViewOutput {
  func viewDidSearch(with query: String) {
    requestSongs(with: query)
  }
  
  func viewDidSelect(with song: SongCellModel) {
    openSongDetails(with: song)
  }
}
