//
//  AppFactory.swift
//  iOSArchitecturesDemo
//
//  Created by  Sergei on 02.06.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

class AppFactory {
  static func softwareVC() -> SearchViewController {
    let presenter = SearchPresenter()
    let vc = SearchViewController(presenter: presenter)
    presenter.viewInput = vc
    vc.navigationItem.title = GlobalConstants.Text.appsSearch
    return vc
  }
  
  static func musicVC() -> SearchMusicViewController {
    let presenter = SearchMusicPresenter()
    let vc = SearchMusicViewController(presenter: presenter)
    presenter.viewInput = vc
    vc.navigationItem.title = GlobalConstants.Text.musicSearch
    return vc
  }

  static func navigationVC(title: String, image: String, viewController: UIViewController) -> UINavigationController {
    let vc = UINavigationController(rootViewController: viewController)
    vc.navigationBar.barTintColor = .varna
    vc.navigationBar.isTranslucent = false
    vc.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: GlobalConstants.Color.background]
    vc.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: GlobalConstants.Color.background]
    vc.tabBarItem = tabBarItem(title: title, image: image)
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
    item.image = UIImage(systemName: image)
    return item
  }

  static func SongDetailVC() -> SongDetailViewController {
    let vc = SongDetailViewController()
    return vc
  }
}
