//
//  SearchView.swift
//  iOSArchitecturesDemo
//
//  Created by Evgeny Kireev on 02/06/2019.
//  Copyright © 2019 ekireev. All rights reserved.
//

import UIKit
import SnapKit

final class SearchView: UIView {
  
  // MARK: - Subviews
  
  private(set) lazy var searchBar: UISearchBar = {
    let searchBar = UISearchBar()
    searchBar.searchBarStyle = .minimal
    return searchBar
  }()
  private(set) lazy var tableView: UITableView = {
    let tableView = UITableView()
    tableView.rowHeight = Constants.Table.rowHeight
    tableView.separatorInset = Constants.Table.separatorInset
    tableView.isHidden = true
    tableView.tableFooterView = UIView()
    return tableView
  }()
  private(set) lazy var emptyResultView: UIView = {
    let emptyResultView = UIView()
    emptyResultView.backgroundColor = Constants.backgroundColor
    emptyResultView.isHidden = true
   return emptyResultView
  }()
  private(set) lazy var emptyResultLabel: UILabel = {
    let emptyResultLabel = UILabel()
    emptyResultLabel.text = Constants.Text.text
    emptyResultLabel.textColor = Constants.Text.textColor
    emptyResultLabel.textAlignment = .center
    emptyResultLabel.font = Constants.Text.font
    return emptyResultLabel
  }()
  
  // MARK: - Init
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    configureUI()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    configureUI()
  }
}

// MARK: - Constants

extension SearchView {
  private enum Constants {
    static let backgroundColor: UIColor = .white
    
    enum Table {
      static let rowHeight: CGFloat = 72
      static let separatorInset = UIEdgeInsets(top: 0.0, left: 12.0, bottom: 0.0, right: 0.0)
    }
    
    enum Text {
      static let text = "Nothing was found"
      static let textColor = UIColor.darkGray
      static let font = UIFont.systemFont(ofSize: 12.0)
    }
  }
}

// MARK: - UI

extension SearchView {
  private func configureUI() {
    backgroundColor = Constants.backgroundColor
    
    addSubview(searchBar)
    addSubview(tableView)
    addSubview(emptyResultView)
    emptyResultView.addSubview(emptyResultLabel)
    setupConstraints()
  }
  
  private func setupConstraints() {
    searchBar.snp.makeConstraints { make in
      make.top.equalToSuperview().offset(8)
      make.leading.trailing.equalTo(safeAreaLayoutGuide)
    }
    tableView.snp.makeConstraints { make in
      make.top.equalTo(searchBar.snp.bottom)
      make.leading.trailing.bottom.equalTo(safeAreaLayoutGuide)
    }
    emptyResultView.snp.makeConstraints { make in
      make.top.equalTo(searchBar.snp.bottom)
      make.leading.trailing.bottom.equalTo(safeAreaLayoutGuide)
    }
    emptyResultLabel.snp.makeConstraints { make in
      make.top.equalTo(emptyResultView.snp.top).offset(12)
      make.leading.trailing.equalTo(emptyResultView)
    }
  }
}
