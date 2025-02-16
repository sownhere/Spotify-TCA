//
//  HomeView.swift
//  Spotify-TCA
//
//  Created by SownFrenky on 2/16/25.
//

import SwiftUI
import ComposableArchitecture

struct HomeView: View {
    let store: StoreOf<HomeReducer>
    
    var body: some View {
        WithViewStore(store, observe: { $0 }) { viewStore in
            ScrollView {
                LazyVStack(spacing: 24) {
                    // Recently Played Section
                    if !viewStore.data.recentlyPlayed.isEmpty {
                        RecentlyPlayedSection(
                            tracks: viewStore.data.recentlyPlayed,
                            onTrackSelected: { track in
                                viewStore.send(.trackSelected(track))
                            }
                        )
                    }
                    
                    // Featured Playlists Section
                    if !viewStore.data.featuredPlaylists.isEmpty {
                        FeaturedPlaylistsSection(
                            playlists: viewStore.data.featuredPlaylists,
                            onPlaylistSelected: { playlist in
                                viewStore.send(.playlistSelected(playlist))
                            }
                        )
                    }
                    
                    // Recommendations Section
                    if !viewStore.data.recommendations.isEmpty {
                        RecommendationsSection(
                            tracks: viewStore.data.recommendations,
                            onTrackSelected: { track in
                                viewStore.send(.trackSelected(track))
                            }
                        )
                    }
                }
                .padding()
            }
            .refreshable {
                viewStore.send(.onRefresh)
            }
            .overlay {
                if viewStore.isLoading {
                    ProgressView()
                }
            }
            .alert(
                "Error",
                isPresented: viewStore.binding(
                    get: \.showErrorAlert,
                    send: .dismissErrorAlert
                ),
                actions: { Button("OK") { viewStore.send(.dismissErrorAlert) } },
                message: { Text(viewStore.error ?? "") }
            )
            .onAppear {
                viewStore.send(.onAppear)
            }
        }
    }
}
