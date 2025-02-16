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
        initialState: AppState(),
        reducer: AppReducer()
        )
    
    var body: some Scene {
        WindowGroup {
            RootView(store: store)
        }
    }
}

