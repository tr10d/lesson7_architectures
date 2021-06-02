//
//  AppStartConfigurator.swift
//  iOSArchitecturesDemo
//
//  Created by ekireev on 19.02.2018.
//  Copyright © 2018 ekireev. All rights reserved.
//

import UIKit

final class AppStartManager {
  var window: UIWindow?

  init(window: UIWindow?) {
    self.window = window
  }
  
  func start() {
    let softwareVC = AppFactory.softwareVC()
    let musicVC = AppFactory.musicVC()
    let softwareNavigationVC = AppFactory.navigationVC(title: GlobalConstants.Text.apps, image: GlobalConstants.Text.appsImageName, viewController: softwareVC)
    let musicNavigationVC = AppFactory.navigationVC(title: GlobalConstants.Text.music, image: GlobalConstants.Text.musicImageName, viewController: musicVC)
    
    let tabBarController = AppFactory.tabBarVC(viewControllers: [softwareNavigationVC, musicNavigationVC])
    
    window?.rootViewController = tabBarController
    window?.makeKeyAndVisible()
  }
}
