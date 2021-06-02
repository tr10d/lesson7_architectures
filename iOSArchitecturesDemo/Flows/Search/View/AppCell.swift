//
//  AppCell.swift
//  iOSArchitecturesDemo
//
//  Created by Evgeny Kireev on 01/03/2019.
//  Copyright © 2019 ekireev. All rights reserved.
//

import UIKit
import SnapKit
import Kingfisher

final class AppCell: UITableViewCell {
  
  // MARK: - Subviews
  
  private(set) lazy var iconImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.backgroundColor = GlobalConstants.Color.subSubSubMain.withAlphaComponent(0.5)
    imageView.layer.cornerRadius = GlobalConstants.cornerRadius
    imageView.layer.masksToBounds = true
    return imageView
  }()
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
    iconImageView.image = nil
    ratingStar.rating = .zero
  }
  
  // MARK: - Methods
  
  func configure(with cellModel: AppCellModel) {
    iconImageView.kf.setImage(with: URL(string: cellModel.icon))
    titleLabel.text = cellModel.title
    subtitleLabel.text = cellModel.subtitle
    ratingLabel.text = cellModel.rating
    ratingStar.rating = cellModel.ratingForStar
  }
}

// MARK: - UI

extension AppCell {
  private func configureUI() {
    addIconImageView()
    addTitleLabel()
    addSubtitleLabel()
    addRatingLabel()
    addRatingStar()
  }

  private func addIconImageView() {
    contentView.addSubview(iconImageView)
    iconImageView.snp.makeConstraints { make in
      make.top.equalToSuperview().offset(GlobalConstants.Offset.verticalSmall + GlobalConstants.Offset.verticalSmall )
      make.leading.equalToSuperview().offset(GlobalConstants.Offset.horizontal)
      make.width.height.equalTo(GlobalConstants.iconTableSize)
    }
  }

  private func addTitleLabel() {
    contentView.addSubview(titleLabel)
    titleLabel.snp.makeConstraints { make in
      make.top.equalToSuperview().offset(GlobalConstants.Offset.verticalSmall  + GlobalConstants.Offset.verticalSmall )
      make.leading.equalTo(iconImageView.snp.trailing).offset(GlobalConstants.Offset.horizontal)
      make.trailing.equalToSuperview().offset(-GlobalConstants.Offset.horizontal)
    }
  }
  
  private func addSubtitleLabel() {
    contentView.addSubview(subtitleLabel)
    subtitleLabel.snp.makeConstraints { make in
      make.top.equalTo(titleLabel.snp.bottom).offset(GlobalConstants.Offset.verticalSmall )
      make.leading.equalTo(iconImageView.snp.trailing).offset(GlobalConstants.Offset.horizontal)
      make.trailing.equalToSuperview().offset(-GlobalConstants.Offset.horizontal)
    }
  }
  
  private func addRatingLabel() {
    contentView.addSubview(ratingLabel)
    ratingLabel.snp.makeConstraints { make in
      make.top.equalTo(subtitleLabel.snp.bottom).offset(GlobalConstants.Offset.verticalSmall )
      make.leading.equalTo(iconImageView.snp.trailing).offset(GlobalConstants.Offset.horizontal)
    }
  }

  private func addRatingStar() {
    contentView.addSubview(ratingStar)
    ratingStar.snp.makeConstraints { make in
      make.centerY.equalTo(ratingLabel.snp.centerY)
      make.leading.equalTo(ratingLabel.snp.trailing).offset(GlobalConstants.Offset.horizontal)
    }
  }
}
