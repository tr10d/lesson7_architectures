//
//  AppDetailViewController.swift
//  iOSArchitecturesDemo
//
//  Created by ekireev on 20.02.2018.
//  Copyright © 2018 ekireev. All rights reserved.
//

import UIKit
import SnapKit

final class AppDetailViewController: UIViewController {
  let app: ITunesApp
  lazy var headerViewController = AppDetailHeaderViewController(app: self.app)
  lazy var descriptionViewController = AppDetailDescriptionViewController(app: self.app)

  init(app: ITunesApp) {
    self.app = app
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.configureUI()
  }
}

extension AppDetailViewController {
  private func configureUI() {
    view.backgroundColor = GlobalConstants.Color.background
    navigationController?.navigationBar.tintColor = GlobalConstants.Color.background;
    navigationItem.largeTitleDisplayMode = .never
    addHeaderViewController()
    addDescriptionViewController()
  }
  
  private func addHeaderViewController() {
    addChild(headerViewController)
    view.addSubview(headerViewController.view)
    headerViewController.didMove(toParent: self)
    
    headerViewController.view.snp.makeConstraints { make in
      make.top.equalTo(view.safeAreaLayoutGuide)
      make.left.right.equalToSuperview()
    }
  }
  
  private func addDescriptionViewController() {
    addChild(descriptionViewController)
    view.addSubview(descriptionViewController.view)
    descriptionViewController.didMove(toParent: self)
    
    descriptionViewController.view.snp.makeConstraints { make in
      make.top.equalTo(headerViewController.view.snp.bottom)
      make.left.right.equalToSuperview()
      make.height.equalTo(250)
    }
  }
}
