//
//  AppDetailHeaderView.swift
//  iOSArchitecturesDemo
//
//  Created by  Sergei on 30.05.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit
import SnapKit

final class AppDetailHeaderView: UIView {
  
  // MARK: - Subviews
  
  private(set) lazy var imageView: UIImageView = {
    let imageView = UIImageView()
    imageView.layer.cornerRadius = 30.0
    imageView.layer.masksToBounds = true
    return imageView
  }()
  private(set) lazy var titleLabel: UILabel = {
    let label = UILabel()
    label.textColor = GlobalConstants.Color.main
    label.font = GlobalConstants.Font.large
    label.numberOfLines = 2
    return label
  }()
  private(set) lazy var subtitleLabel: UILabel = {
    let label = UILabel()
    label.textColor = GlobalConstants.Color.subMain
    label.font = GlobalConstants.Font.medium
    return label
  }()
  private(set) lazy var openButton: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle(GlobalConstants.Text.open, for: .normal)
    button.backgroundColor = GlobalConstants.Color.button
    button.layer.cornerRadius = 16.0
    return button
  }()
  private(set) lazy var ratingLabel: UILabel = {
    let label = UILabel()
    label.textColor = GlobalConstants.Color.subMain
    label.font = GlobalConstants.Font.large
    return label
  }()
  private(set) lazy var ratingStar: StarRatingView = {
    let stackView = StarRatingView()
    stackView.starColor = GlobalConstants.Color.subMain
    return stackView
  }()

  // MARK: - Init
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupLayout()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setupLayout()
  }
}

// MARK: - UI

extension AppDetailHeaderView {
  private func setupLayout() {
    addSubview(imageView)
    addSubview(titleLabel)
    addSubview(subtitleLabel)
    addSubview(openButton)
    addSubview(ratingLabel)
    addSubview(ratingStar)
    
    setupConstraints()
  }
  
  private func setupConstraints() {
    let horizontal = GlobalConstants.Offset.horizontal
    let vertical = GlobalConstants.Offset.vertical
    
    imageView.snp.makeConstraints { make in
      make.top.equalTo(safeAreaLayoutGuide).offset(vertical)
      make.leading.equalToSuperview().offset(horizontal)
      make.width.height.equalTo(120)
    }
    titleLabel.snp.makeConstraints { make in
      make.top.equalTo(safeAreaLayoutGuide).offset(vertical)
      make.leading.equalTo(imageView.snp.trailing).offset(horizontal)
      make.trailing.equalToSuperview().offset(-horizontal)
    }
    subtitleLabel.snp.makeConstraints { make in
      make.top.equalTo(titleLabel.snp.bottom).offset(vertical)
      make.leading.equalTo(titleLabel.snp.leading)
      make.trailing.equalTo(titleLabel.snp.trailing)
    }
    openButton.snp.makeConstraints { make in
      make.leading.equalTo(imageView.snp.trailing).offset(horizontal)
      make.bottom.equalTo(imageView.snp.bottom)
      make.width.equalTo(80)
      make.height.equalTo(32)
    }
    ratingLabel.snp.makeConstraints { make in
      make.top.equalTo(imageView.snp.bottom).offset(vertical + vertical)
      make.leading.equalTo(imageView.snp.leading)
      make.bottom.equalToSuperview()
    }
    ratingStar.snp.makeConstraints { make in
      make.leading.equalTo(ratingLabel.snp.trailing).offset(vertical)
      make.centerY.equalTo(ratingLabel.snp.centerY)
    }
  }
}
