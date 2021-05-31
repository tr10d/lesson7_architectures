//
//  StarRatingView.swift
//  iOSArchitecturesDemo
//
//  Created by  Sergei on 30.05.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit
import SnapKit

final class StarRatingView: UIStackView {
  var rating: Float? = 0 {
    didSet {
      setStarsFor(rating: rating ?? 0)
    }
  }
  var starColor: UIColor = .blue {
    didSet {
      for starImageView in allStars {
          starImageView.tintColor = starColor
      }
    }
  }
  private var allStars: [UIImageView] {
    [star1ImageView, star2ImageView, star3ImageView, star4ImageView, star5ImageView]
  }
  private lazy var star1ImageView = UIImageView(image: Constants.emptyStarImage)
  private lazy var star2ImageView = UIImageView(image: Constants.emptyStarImage)
  private lazy var star3ImageView = UIImageView(image: Constants.emptyStarImage)
  private lazy var star4ImageView = UIImageView(image: Constants.emptyStarImage)
  private lazy var star5ImageView = UIImageView(image: Constants.emptyStarImage)
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    configureUI()
  }
  
  required init(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    configureUI()
  }
  
  private func configureUI() {
    allStars.forEach { view in
      self.addArrangedSubview(view)
      view.snp.makeConstraints { make in
        make.width.equalTo(view.snp.height)
      }
    }
  }
  
  private func setStarsFor(rating: Float) {
    for i in 1...5 {
      let iFloat = Float(i)
      allStars[i - 1].image = rating >= iFloat - 0.25 ? Constants.fullStarImage :
        (rating >= iFloat - 0.75 ? Constants.halfStarImage : Constants.emptyStarImage)
    }
  }
}

// MARK: - Constants

extension StarRatingView {
  private enum Constants {
    static let fullStarImage = UIImage(systemName: "star.fill")
    static let halfStarImage = UIImage(systemName: "star.lefthalf.fill")
    static let emptyStarImage = UIImage(systemName: "star")
  }
}
