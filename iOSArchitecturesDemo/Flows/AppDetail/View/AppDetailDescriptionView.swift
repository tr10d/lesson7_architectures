//
//  AppDetailDescriptionView.swift
//  iOSArchitecturesDemo
//
//  Created by  Sergei on 30.05.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit
import SnapKit

final class AppDetailDescriptionView: UIView {
  private(set) lazy var titleLabel: UILabel = {
    let label = UILabel()
    label.text = GlobalConstants.Text.new
    label.textColor = GlobalConstants.Color.main
    label.font = GlobalConstants.Font.large
    return label
  }()
  private(set) lazy var versionLabel: UILabel = {
    let label = UILabel()
    label.textColor = GlobalConstants.Color.subMain
    label.font = GlobalConstants.Font.medium
    return label
  }()
  private(set) lazy var releaseNotesLabel: UILabel = {
    let label = UILabel()
    label.textColor = GlobalConstants.Color.main
    label.font = GlobalConstants.Font.medium
    label.numberOfLines = 2
    return label
  }()
  private(set) lazy var versionHistoryLabel: UILabel = {
    let label = UILabel()
    label.text = GlobalConstants.Text.history
    label.textColor = GlobalConstants.Color.link
    label.font = GlobalConstants.Font.medium
    return label
  }()
  private(set) lazy var lastReleaseLabel: UILabel = {
    let label = UILabel()
    label.textColor = GlobalConstants.Color.subMain
    label.font = GlobalConstants.Font.medium
    return label
  }()

  // MARK: - Init
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    self.setupLayout()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    self.setupLayout()
  }
}

extension AppDetailDescriptionView {
  private func setupLayout() {
    addSubview(titleLabel)
    addSubview(versionHistoryLabel)
    addSubview(versionLabel)
    addSubview(lastReleaseLabel)
    addSubview(releaseNotesLabel)

    setupConstraints()
  }
  
  private func setupConstraints() {
    let horizontal = GlobalConstants.Offset.horizontal
    let vertical = GlobalConstants.Offset.vertical
    
    titleLabel.snp.makeConstraints { make in
      make.top.equalToSuperview().offset(vertical)
      make.leading.equalToSuperview().offset(horizontal)
    }
    versionHistoryLabel.snp.makeConstraints { make in
      make.centerY.equalTo(titleLabel.snp.centerY)
      make.trailing.equalToSuperview().offset(-horizontal)
    }
    versionLabel.snp.makeConstraints { make in
      make.top.equalTo(titleLabel.snp.bottom).offset(vertical)
      make.leading.equalToSuperview().offset(horizontal)
    }
    lastReleaseLabel.snp.makeConstraints { make in
      make.centerY.equalTo(versionLabel.snp.centerY)
      make.trailing.equalToSuperview().offset(-horizontal)
    }
    releaseNotesLabel.snp.makeConstraints { make in
      make.top.equalTo(versionLabel.snp.bottom).offset(vertical)
      make.leading.equalToSuperview().offset(horizontal)
      make.trailing.equalToSuperview().offset(-horizontal)
    }
  }
}
