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
    label.textColor = .black
    label.font = UIFont.boldSystemFont(ofSize: 20.0)
    label.numberOfLines = 2
    return label
  }()
  private(set) lazy var subtitleLabel: UILabel = {
    let label = UILabel()
    label.textColor = .lightGray
    label.font = UIFont.systemFont(ofSize: 14.0)
    return label
  }()
  private(set) lazy var openButton: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("Открыть", for: .normal)
    button.backgroundColor = UIColor(white: 0.9, alpha: 1.0)
    button.layer.cornerRadius = 16.0
    return button
  }()
  private(set) lazy var ratingLabel: UILabel = {
    let label = UILabel()
    label.textColor = .lightGray
    label.font = UIFont.boldSystemFont(ofSize: 20.0)
    return label
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
    setupConstraints()
  }
  
  private func setupConstraints() {
    imageView.snp.makeConstraints { make in
      make.top.equalTo(safeAreaLayoutGuide).offset(12)
      make.left.equalToSuperview().offset(16)
      make.width.height.equalTo(120)
    }
    titleLabel.snp.makeConstraints { make in
      make.top.equalTo(safeAreaLayoutGuide).offset(12)
      make.left.equalTo(imageView.snp.right).offset(16)
      make.right.equalToSuperview().offset(-16)
    }
    subtitleLabel.snp.makeConstraints { make in
      make.top.equalTo(titleLabel.snp.bottom).offset(12)
      make.left.equalTo(titleLabel.snp.left)
      make.right.equalTo(titleLabel.snp.right)
    }
    openButton.snp.makeConstraints { make in
      make.left.equalTo(imageView.snp.right).offset(16)
      make.bottom.equalTo(imageView.snp.bottom)
      make.width.equalTo(80)
      make.height.equalTo(32)
    }
    ratingLabel.snp.makeConstraints { make in
      make.top.equalTo(imageView.snp.bottom).offset(24)
      make.left.equalTo(imageView.snp.left)
      make.width.equalTo(100)
      make.bottom.equalToSuperview()
    }
  }
}
