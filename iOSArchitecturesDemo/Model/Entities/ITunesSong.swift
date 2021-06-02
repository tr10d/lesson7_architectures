//
//  ITunesSong.swift
//  iOSArchitecturesDemo
//
//  Created by ekireev on 19.02.2018.
//  Copyright © 2018 ekireev. All rights reserved.
//

import UIKit

public struct ITunesSong: Codable {
  
  public var trackName: String
  public var artistName: String?
  public var collectionName: String?
  public var artworkDetail: String?
  public var artworkPreview: String?
  
  // MARK: - Codable
  
  private enum CodingKeys: String, CodingKey {
    case trackName = "trackName"
    case artistName = "artistName"
    case collectionName = "collectionName"
    case artworkDetail = "artworkUrl100"
    case artworkPreview = "artworkUrl60"
  }
  
  // MARK: - Init
  
  internal init(trackName: String,
                artistName: String?,
                collectionName: String?,
                artworkDetail: String?,
                artworkPreview: String?) {
    self.trackName = trackName
    self.artistName = artistName
    self.collectionName = collectionName
    self.artworkDetail = artworkDetail
    self.artworkPreview = artworkPreview
  }
}
