//
//  HomeReducer.swift
//  Spotify-TCA
//
//  Created by SownFrenky on 2/16/25.
//

import Foundation
import ComposableArchitecture

struct Home: Reducer {
    struct State: Equatable {
        var recentlyPlayed: [Track] = []
        var recommendations: [Track] = []
        var isLoading: Bool = false
    }
    
    enum Action {
        case onAppear
        case loadRecentlyPlayed
        case loadRecommendations
        case recentlyPlayedResponse(TaskResult<[Track]>)
        case recommendationsResponse(TaskResult<[Track]>)
        case selectTrack(Track)
    }
    
    @Dependency(\MockAPIClient.apiClient) var apiClient
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .onAppear:
                return .merge(
                    Effect.send(.loadRecentlyPlayed),
                    Effect.send(.loadRecommendations)
                )
                
            case .loadRecentlyPlayed:
                state.isLoading = true
                return apiClient.fetchRecentlyPlayed()
                    .map(Action.recentlyPlayedResponse)
                
            case .loadRecommendations:
                state.isLoading = true
                return apiClient.fetchRecommendations()
                    .map(Action.recommendationsResponse)
                
            case let .recentlyPlayedResponse(.success(tracks)):
                state.recentlyPlayed = tracks
                state.isLoading = false
                return .none
                
            case let .recommendationsResponse(.success(tracks)):
                state.recommendations = tracks
                state.isLoading = false
                return .none
                
            case .recentlyPlayedResponse(.failure):
                state.isLoading = false
                return .none
                
            case .recommendationsResponse(.failure):
                state.isLoading = false
                return .none
                
            case .selectTrack:
                return .none
            }
        }
    }
}
