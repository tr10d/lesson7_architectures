//
//  GlobalConstants.swift
//  iOSArchitecturesDemo
//
//  Created by  Sergei on 31.05.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

enum GlobalConstants {
  static let cornerRadius: CGFloat = 10.0

  enum Color {
    static let main: UIColor = .black
    static let subMain: UIColor = .lightGray
    static let subSubMain: UIColor = .darkGray
    static let subSubSubMain: UIColor = .gray
    static let background: UIColor = .white
    static let button = UIColor(white: 0.9, alpha: 1.0)
    static let link: UIColor = .systemBlue
  }
  
  enum Font {
    static let large = UIFont.boldSystemFont(ofSize: 20.0)
    static let subLarge = UIFont.boldSystemFont(ofSize: 16.0)
    static let medium = UIFont.systemFont(ofSize: 14.0)
    static let subMedium = UIFont.systemFont(ofSize: 13.0)
    static let small = UIFont.systemFont(ofSize: 12.0)
  }
  
  enum Text {
    static let apps = "Приложения"
    static let music = "Музыка"
    static let appsImageName = "app"
    static let musicImageName = "music.note"
    static let appsSearch = "Поиск приложений"
    static let musicSearch = "Поиск музыки"
    static let new = "Что нового"
    static let history = "История версий"
    static let nothingFound = "Ничего не найдено"
    static let open = "Открыть"
    static let version = "Версия"
  }
  
  enum Offset {
    static let horizontal: Int = 16
    static let vertical: Int = 12
 }
}
