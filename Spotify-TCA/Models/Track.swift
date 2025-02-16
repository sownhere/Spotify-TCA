//
//  Track.swift
//  Spotify-TCA
//
//  Created by SownFrenky on 2/16/25.
//

import Foundation

struct Track: Identifiable, Equatable {
    let id: String
    let title: String
    let artist: String
    let albumArt: String
    let duration: TimeInterval
}
