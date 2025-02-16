//
//  MockData.swift
//  Spotify-TCA
//
//  Created by SownFrenky on 2/16/25.
//


import Foundation

enum MockData {
    static let tracks: [Track] = [
        Track(id: "1", title: "Shape of You", artist: "Ed Sheeran", albumArt: "album1", duration: 235),
        Track(id: "2", title: "Blinding Lights", artist: "The Weeknd", albumArt: "album2", duration: 200),
        Track(id: "3", title: "Stay", artist: "Justin Bieber", albumArt: "album3", duration: 210),
        Track(id: "4", title: "Bad Guy", artist: "Billie Eilish", albumArt: "album4", duration: 194),
    ]
    
    static let albums: [Album] = [
        Album(id: "1", title: "÷ (Divide)", artist: "Ed Sheeran", coverArt: "album1", tracks: tracks),
        Album(id: "2", title: "After Hours", artist: "The Weeknd", coverArt: "album2", tracks: tracks),
    ]
    
    static let artists: [Artist] = [
        Artist(id: "1", name: "Ed Sheeran", imageUrl: "artist1", followers: 84500000),
        Artist(id: "2", name: "The Weeknd", imageUrl: "artist2", followers: 75300000),
    ]
}

import ComposableArchitecture

struct MockAPIClient {
    var fetchRecentlyPlayed: () -> Effect<[Track], Error>
    var fetchRecommendations: () -> Effect<[Track], Error>
    var searchTracks: (String) -> Effect<[Track], Error>
    var fetchLibrary: () -> Effect<[Album], Error>
}

extension MockAPIClient {
    static let live = Self(
        fetchRecentlyPlayed: {
            Effect.task {
                try await Task.sleep(nanoseconds: 1_000_000_000)
                return MockData.tracks
            }
        },
        fetchRecommendations: {
            Effect.task {
                try await Task.sleep(nanoseconds: 1_000_000_000)
                return MockData.tracks.shuffled()
            }
        },
        searchTracks: { query in
            Effect.task {
                try await Task.sleep(nanoseconds: 1_000_000_000)
                return MockData.tracks.filter { $0.title.lowercased().contains(query.lowercased()) }
            }
        },
        fetchLibrary: {
            Effect.task {
                try await Task.sleep(nanoseconds: 1_000_000_000)
                return MockData.albums
            }
        }
    )
}
