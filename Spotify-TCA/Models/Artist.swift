//
//  Artist.swift
//  Spotify-TCA
//
//  Created by SownFrenky on 2/16/25.
//

import Foundation

struct Artist: Identifiable, Equatable {
    let id: String
    let name: String
    let imageUrl: String
    let followers: Int
}
