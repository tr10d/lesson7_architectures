//
//  AppCell.swift
//  iOSArchitecturesDemo
//
//  Created by Evgeny Kireev on 01/03/2019.
//  Copyright © 2019 ekireev. All rights reserved.
//

import UIKit
import SnapKit

final class AppCell: UITableViewCell {
  
  // MARK: - Subviews
  
  private(set) lazy var titleLabel: UILabel = {
    let label = UILabel()
    label.textColor = .black
    label.font = GlobalConstants.Font.subLarge
    return label
  }()
  private(set) lazy var subtitleLabel: UILabel = {
    let label = UILabel()
    label.textColor = .gray
    label.font = GlobalConstants.Font.subMedium
    return label
  }()
  private(set) lazy var ratingLabel: UILabel = {
    let label = UILabel()
    label.textColor = .lightGray
    label.font = GlobalConstants.Font.small
    return label
  }()
  private(set) lazy var ratingStar: StarRatingView = {
    let stackView = StarRatingView()
    stackView.starColor = .lightGray
    return stackView
  }()
  
  // MARK: - Init
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    configureUI()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    configureUI()
  }
  
  override func prepareForReuse() {
    [titleLabel, subtitleLabel, ratingLabel].forEach { $0.text = nil }
  }
  
  // MARK: - Methods
  
  func configure(with cellModel: AppCellModel) {
    titleLabel.text = cellModel.title
    subtitleLabel.text = cellModel.subtitle
    ratingLabel.text = cellModel.rating
    ratingStar.rating = cellModel.ratingForStar
  }
}

// MARK: - Constants

extension AppCell {
  private enum Constants {
    enum Edge {
      static let offsetTop = 4
      static let offsetLet = 12
      static let offsetRight = -40
    }
  }
}

// MARK: - UI

extension AppCell {
  private func configureUI() {
    addTitleLabel()
    addSubtitleLabel()
    addRatingLabel()
    addRatingStar()
  }
  
  private func addTitleLabel() {
    contentView.addSubview(titleLabel)
    titleLabel.snp.makeConstraints { make in
      make.top.equalToSuperview().offset(Constants.Edge.offsetTop + Constants.Edge.offsetTop)
      make.left.equalToSuperview().offset(Constants.Edge.offsetLet)
      make.right.equalToSuperview().offset(Constants.Edge.offsetRight)
    }
  }
  
  private func addSubtitleLabel() {
    contentView.addSubview(subtitleLabel)
    subtitleLabel.snp.makeConstraints { make in
      make.top.equalTo(titleLabel.snp.bottom).offset(Constants.Edge.offsetTop)
      make.left.equalToSuperview().offset(Constants.Edge.offsetLet)
      make.right.equalToSuperview().offset(Constants.Edge.offsetRight)
    }
  }
  
  private func addRatingLabel() {
    contentView.addSubview(ratingLabel)
    ratingLabel.snp.makeConstraints { make in
      make.top.equalTo(subtitleLabel.snp.bottom).offset(Constants.Edge.offsetTop)
      make.left.equalToSuperview().offset(Constants.Edge.offsetLet)
    }
  }

  private func addRatingStar() {
    contentView.addSubview(ratingStar)
    ratingStar.snp.makeConstraints { make in
      make.centerY.equalTo(ratingLabel.snp.centerY)
      make.left.equalTo(ratingLabel.snp.right).offset(Constants.Edge.offsetLet)
//      make.height.equalTo(ratingLabel.snp.height)
    }
  }
}
