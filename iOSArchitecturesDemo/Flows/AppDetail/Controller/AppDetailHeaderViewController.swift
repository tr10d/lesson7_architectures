//
//  AppDetailHeaderViewController.swift
//  iOSArchitecturesDemo
//
//  Created by  Sergei on 30.05.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit
import Kingfisher

final class AppDetailHeaderViewController: UIViewController {
  
  // MARK: - Properties
  
  private let app: ITunesApp
  private var appDetailHeaderView: AppDetailHeaderView {
    return self.view as! AppDetailHeaderView
  }
  
  // MARK: - Init
  
  init(app: ITunesApp) {
    self.app = app
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - Lifecycle
  
  override func loadView() {
    super.loadView()
    self.view = AppDetailHeaderView()
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.fillData()
  }
  
  // MARK: - Private
  
  private func fillData() {
    downloadImage()
    appDetailHeaderView.titleLabel.text = app.appName
    appDetailHeaderView.subtitleLabel.text = app.company
    appDetailHeaderView.ratingLabel.text = app.averageRating.flatMap { "\($0)" }
    appDetailHeaderView.ratingStar.rating = app.averageRating
  }
  
  private func downloadImage() {
    guard let url = self.app.iconUrl else { return }
    appDetailHeaderView.imageView.kf.setImage(with: URL(string: url))
  }
}
