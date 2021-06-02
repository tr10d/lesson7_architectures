//
//  MusicCell.swift
//  iOSArchitecturesDemo
//
//  Created by  Sergei on 01.06.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit
import SnapKit
import Kingfisher

final class MusicCell: UITableViewCell {
  private(set) lazy var artworkImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.backgroundColor = GlobalConstants.Color.subSubSubMain.withAlphaComponent(0.5)
    return imageView
  }()
  private(set) lazy var trackNameLabel: UILabel = {
    let label = UILabel()
    label.textColor = .black
    label.font = GlobalConstants.Font.subLarge
    return label
  }()
  private(set) lazy var artistNameLabel: UILabel = {
    let label = UILabel()
    label.textColor = .gray
    label.font = GlobalConstants.Font.subMedium
    return label
  }()
  private(set) lazy var collectionNameLabel: UILabel = {
    let label = UILabel()
    label.textColor = .gray
    label.font = GlobalConstants.Font.small
    return label
  }()

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    configureUI()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    configureUI()
  }

  override func prepareForReuse() {
    configure(with: nil)
  }
}

extension MusicCell {
  private func configureUI() {
    contentView.addSubview(artworkImageView)
    contentView.addSubview(trackNameLabel)
    contentView.addSubview(artistNameLabel)
    contentView.addSubview(collectionNameLabel)
    makeConstraints()
  }

  private func makeConstraints() {
    artworkImageView.snp.makeConstraints { make in
      make.top.equalToSuperview().offset(GlobalConstants.Offset.verticalSmall)
      make.leading.equalToSuperview().offset(GlobalConstants.Offset.horizontal)
      make.width.height.equalTo(GlobalConstants.iconTableSize)
    }
    trackNameLabel.snp.makeConstraints { make in
      make.top.equalToSuperview().offset(GlobalConstants.Offset.verticalSmall)
      make.leading.equalTo(artworkImageView.snp.trailing).offset(GlobalConstants.Offset.horizontal)
      make.trailing.equalToSuperview().offset(-GlobalConstants.Offset.horizontal)
    }
    artistNameLabel.snp.makeConstraints { make in
      make.top.equalTo(trackNameLabel.snp.bottom).offset(GlobalConstants.Offset.verticalSmall)
      make.leading.equalTo(artworkImageView.snp.trailing).offset(GlobalConstants.Offset.horizontal)
      make.trailing.equalToSuperview().offset(-GlobalConstants.Offset.horizontal)
    }
    collectionNameLabel.snp.makeConstraints { make in
      make.top.equalTo(artistNameLabel.snp.bottom).offset(GlobalConstants.Offset.verticalSmall)
      make.leading.equalTo(artworkImageView.snp.trailing).offset(GlobalConstants.Offset.horizontal)
      make.trailing.equalToSuperview().offset(-GlobalConstants.Offset.horizontal)
    }
  }
}

extension MusicCell {
  func configure(with cellModel: SongCellModel?) {
    guard let cellModel = cellModel else {
      artworkImageView.image = nil
      [artistNameLabel, trackNameLabel, artistNameLabel, collectionNameLabel].forEach { $0.text = nil }
      return
    }
    
    artistNameLabel.text = cellModel.artistName
    trackNameLabel.text = cellModel.trackName
    collectionNameLabel.text = cellModel.collectionName
    artworkImageView.kf.setImage(with: URL(string: cellModel.artworkDetail))
  }
}
