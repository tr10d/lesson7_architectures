//
//  SearchViewProtocols.swift
//  iOSArchitecturesDemo
//
//  Created by  Sergei on 31.05.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

protocol SearchViewInput: AnyObject {
  var searchResults: [ITunesApp] { get set }
  
  func showError(error: Error)
  func showNoResults()
  func hideNoResults()
}

protocol SearchViewOutput: AnyObject {
  func viewDidSearch(with query: String)
  func viewDidSelectApp(_ app: ITunesApp)
}
