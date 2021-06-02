//
//  ITunesApp.swift
//  iOSArchitecturesDemo
//
//  Created by ekireev on 19.02.2018.
//  Copyright © 2018 ekireev. All rights reserved.
//

import UIKit

public struct ITunesApp: Codable {
  
  public typealias Bytes = Int
  
  public let appName: String
  public let appUrl: String?
  public let company: String?
  public let companyUrl: String?
  public let appDescription: String?
  public let averageRating: Float?
  public let averageRatingForCurrentVersion: Float?
  public let size: Bytes?
  public let iconUrl: String?
  public let iconUrlMini: String?
  public let screenshotUrls: [String]
  public let version: String?
  public let releaseNotes: String?
  public let releaseDate: Date?
  
  // MARK: - Codable
  
  private enum CodingKeys: String, CodingKey {
    case appName = "trackName"
    case appUrl = "artistViewUrl"
    case company = "sellerName"
    case companyUrl = "sellerUrl"
    case appDescription = "description"
    case averageRating = "averageUserRating"
    case averageRatingForCurrentVersion = "averageUserRatingForCurrentVersion"
    case size = "fileSizeBytes"
    case iconUrl = "artworkUrl512"
    case iconUrlMini = "artworkUrl60"
    case screenshotUrls = "screenshotUrls"
    case version = "version"
    case releaseNotes = "releaseNotes"
    case releaseDate = "currentVersionReleaseDate"
  }
  
  public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    self.appName = try container.decode(String.self, forKey: .appName)
    self.appUrl = try? container.decode(String.self, forKey: .appUrl)
    self.company = try? container.decode(String.self, forKey: .company)
    self.companyUrl = try? container.decode(String.self, forKey: .companyUrl)
    self.appDescription = try? container.decode(String.self, forKey: .appDescription)
    self.averageRating = (try? container.decode(Float.self, forKey: .averageRating)) >>- { round($0 * 10) / 10 }
    self.averageRatingForCurrentVersion = (try? container.decode(Float.self, forKey: .averageRatingForCurrentVersion)) >>- { round($0 * 10) / 10 }
    self.size = (try? container.decode(String.self, forKey: .size)) >>- { Bytes($0) }
    self.iconUrl = try? container.decode(String.self, forKey: .iconUrl)
    self.iconUrlMini = try? container.decode(String.self, forKey: .iconUrlMini)
    self.screenshotUrls = (try? container.decode([String].self, forKey: .screenshotUrls)) ?? []
    self.version = try? container.decode(String.self, forKey: .version)
    self.releaseNotes = try? container.decode(String.self, forKey: .releaseNotes)
    self.releaseDate = try? container.decode(Date.self, forKey: .releaseDate)
  }
  
  // MARK: - Init
  
  internal init(appName: String,
                appUrl: String?,
                company: String?,
                companyUrl: String?,
                appDescription: String?,
                averageRating: Float?,
                averageRatingForCurrentVersion: Float?,
                size: Bytes?,
                iconUrl: String?,
                iconUrlMini: String?,
                screenshotUrls: [String],
                version: String?,
                releaseNotes: String?,
                releaseDate: Date?) {
    self.appName = appName
    self.appUrl = appUrl
    self.company = company
    self.companyUrl = companyUrl
    self.appDescription = appDescription
    self.averageRating = averageRating
    self.averageRatingForCurrentVersion = averageRatingForCurrentVersion
    self.size = size
    self.iconUrl = iconUrl
    self.iconUrlMini = iconUrlMini
    self.screenshotUrls = screenshotUrls
    self.version = version
    self.releaseNotes = releaseNotes
    self.releaseDate = releaseDate
  }
}
