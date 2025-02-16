//
//  Album.swift
//  Spotify-TCA
//
//  Created by SownFrenky on 2/16/25.
//

import Foundation

struct Album: Identifiable, Equatable {
    let id: String
    let title: String
    let artist: String
    let coverArt: String
    let tracks: [Track]
}
