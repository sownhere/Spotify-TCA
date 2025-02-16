//
//  Spotify_TCAApp.swift
//  Spotify-TCA
//
//  Created by SownFrenky on 2/16/25.
//

import SwiftUI
import ComposableArchitecture

@main
struct SpotifyApp: App {
    let store = Store(
        initialState: AppReducer.State(),
        reducer: AppReducer()
    )
    
    var body: some Scene {
        WindowGroup {
            SpotifyAppView(store: store)
        }
    }
}

