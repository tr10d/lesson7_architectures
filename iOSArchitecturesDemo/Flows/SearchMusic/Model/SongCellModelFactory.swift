//
//  SongCellModelFactory.swift
//  iOSArchitecturesDemo
//
//  Created by  Sergei on 01.06.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import Foundation

struct SongCellModel {
  let trackName: String
  let artistName: String?
  let collectionName: String?
  let artworkDetail: String
  let artworkPreview: String
  
  init(song: ITunesSong) {
    trackName = song.trackName
    artistName = song.artistName
    collectionName = song.collectionName
    artworkDetail = song.artworkDetail ?? ""
    artworkPreview = song.artworkPreview ?? ""
  }
}

final class SongCellModelFactory {
  static func cellModel(from song: ITunesSong) -> SongCellModel {
    .init(song: song)
  }
}
