//
//  HomeView.swift
//  Spotify-TCA
//
//  Created by SownFrenky on 2/16/25.
//

import SwiftUI
import ComposableArchitecture

struct HomeView: View {
    let store: StoreOf<Home>
    
    var body: some View {
        WithViewStore(store, observe: { $0 }) { viewStore in
            ScrollView {
                VStack(spacing: 32) {
                    RecentlyPlayedSection(
                        tracks: viewStore.recentlyPlayed,
                        onTrackSelected: { track in
                            viewStore.send(.selectTrack(track))
                        }
                    )
                    
                    RecommendationsSection(
                        tracks: viewStore.recommendations,
                        onTrackSelected: { track in
                            viewStore.send(.selectTrack(track))
                        }
                    )
                }
                .padding(.vertical)
            }
            .overlay {
                if viewStore.isLoading {
                    ProgressView()
                }
            }
            .onAppear {
                viewStore.send(.onAppear)
            }
        }
    }
}
