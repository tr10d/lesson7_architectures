//
//  AppDetailView.swift
//  iOSArchitecturesDemo
//
//  Created by Evgeny Kireev on 02/06/2019.
//  Copyright © 2019 ekireev. All rights reserved.
//

import UIKit
import SnapKit

final class AppDetailView: UIView {
  
  // MARK: - Subviews
  
  private(set) lazy var imageView: UIImageView = {
    let imageView = UIImageView()
    imageView.backgroundColor = Constants.Image.backgroundColor
    imageView.layer.cornerRadius = Constants.Image.cornerRadius
    imageView.layer.masksToBounds = true
    return imageView
  }()
  private(set) lazy var throbber: UIActivityIndicatorView = {
    let activityIndicatorView = UIActivityIndicatorView(style: Constants.ActivityIndicator.style)
    return activityIndicatorView
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

extension AppDetailView {
  enum Constants {
    enum Image {
      static let backgroundColor = UIColor.gray.withAlphaComponent(0.5)
      static let cornerRadius: CGFloat = 10.0
    }
    enum ActivityIndicator {
      static let style: UIActivityIndicatorView.Style = .gray
    }
  }
}

// MARK: - UI

extension AppDetailView {
  private func configureUI() {
    backgroundColor = .white
    addSubview(imageView)
    imageView.addSubview(throbber)
    setupConstraints()
  }
  
  private func setupConstraints() {
    imageView.snp.makeConstraints { make in
      make.width.height.equalTo(100)
      make.centerX.centerY.equalToSuperview()
    }
    throbber.snp.makeConstraints { make in
      make.centerX.centerY.equalToSuperview()
    }
  }
}
