//
//  AppCellModel.swift
//  iOSArchitecturesDemo
//
//  Created by Evgeny Kireev on 02/06/2019.
//  Copyright © 2019 ekireev. All rights reserved.
//

import Foundation

struct AppCellModel {
  let icon: String
  let title: String
  let subtitle: String?
  let rating: String?
  let ratingForStar: Float
}

final class AppCellModelFactory {
  
  static func cellModel(from model: ITunesApp) -> AppCellModel {
    return AppCellModel(icon: model.iconUrlMini ?? "",
                        title: model.appName,
                        subtitle: model.company,
                        rating: model.averageRating >>- { "\($0)" },
                        ratingForStar: model.averageRating ?? 0)
  }
}
