//
//  SearchMusicProtocols.swift
//  iOSArchitecturesDemo
//
//  Created by  Sergei on 01.06.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import Foundation

protocol SearchMusicViewInput: AnyObject {
  func showError(error: Error)
  func showNoResults()
  func showResults()
}

protocol SearchMusicViewOutput: AnyObject {
  var searchResults: [SongCellModel] { get set }

  func viewDidSearch(with query: String)
  func viewDidSelect(with song: SongCellModel)
}
