//
//  AppDetailDescriptionViewController.swift
//  iOSArchitecturesDemo
//
//  Created by  Sergei on 30.05.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

class AppDetailDescriptionViewController: UIViewController {
  private let app: ITunesApp
  private var appDetailDescriptionView: AppDetailDescriptionView {
    return self.view as! AppDetailDescriptionView
  }

  init(app: ITunesApp) {
    self.app = app
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func loadView() {
    super.loadView()
    self.view = AppDetailDescriptionView()
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    fillData()
  }
  
  private func fillData() {
    appDetailDescriptionView.versionLabel.text = "\(GlobalConstants.Text.version) \(app.version ?? "")"
    appDetailDescriptionView.releaseNotesLabel.text = app.releaseNotes
    appDetailDescriptionView.lastReleaseLabel.text = app.releaseDate?.description ?? ""
  }
}
