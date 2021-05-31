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
    let softwareVC = AppStartManagerFactory.softwareVC()
    let musicVC = AppStartManagerFactory.musicVC()
    let softwareNavigationVC = AppStartManagerFactory.navigationVC(title: GlobalConstants.Text.apps, image: GlobalConstants.Text.appsImageName, viewControllers: [softwareVC])
    let musicNavigationVC = AppStartManagerFactory.navigationVC(title: GlobalConstants.Text.music, image: GlobalConstants.Text.musicImageName, viewControllers: [musicVC])
    
    let tabBarController = AppStartManagerFactory.tabBarVC(viewControllers: [softwareNavigationVC, musicNavigationVC])
    
    window?.rootViewController = tabBarController
    window?.makeKeyAndVisible()
  }
}

class AppStartManagerFactory {
  static func softwareVC() -> SearchViewController {
    let presenter = SearchPresenter()
    let vc = SearchViewController(presenter: presenter)
    presenter.viewInput = vc
    vc.navigationItem.title = GlobalConstants.Text.appsSearch
    return vc
  }
  
  static func musicVC() -> SearchMisicViewController {
    let vc = SearchMisicViewController()
    vc.navigationItem.title = GlobalConstants.Text.musicSearch
    return vc
  }

  static func navigationVC(title: String, image: String, viewControllers: [UIViewController]) -> UINavigationController {
    let vc = UINavigationController()
    vc.navigationBar.barTintColor = .varna
    vc.navigationBar.isTranslucent = false
    vc.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: GlobalConstants.Color.background]
    vc.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: GlobalConstants.Color.background]
    vc.tabBarItem = tabBarItem(title: title, image: image)
    vc.viewControllers = viewControllers
    return vc
  }
  
  static func tabBarVC(viewControllers: [UIViewController]) -> UITabBarController {
    let tabBarController = UITabBarController()
    tabBarController.viewControllers = viewControllers
    return tabBarController
  }
  
  static func tabBarItem(title: String, image: String) -> UITabBarItem {
    let item = UITabBarItem()
    item.title = title
    item.image = UIImage(named: image)
    return item
  }
}

