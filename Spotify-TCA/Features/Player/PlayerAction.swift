//
//  PlayerAction.swift
//  Spotify-TCA
//
//  Created by SownFrenky on 2/16/25.
//


enum PlayerAction: Equatable {
    // View Actions
    case playPauseButtonTapped
    case nextTrackTapped
    case previousTrackTapped
    case seekTo(TimeInterval)
    case volumeChanged(Double)
    case shuffleButtonTapped
    case repeatButtonTapped
    case queueButtonTapped
    case miniPlayerTapped
    
    // Internal Actions
    case _updatePlaybackTime(TimeInterval)
    case _updatePlaybackState(PlaybackState)
    case _loadTrack(Track)
    case _updateQueue([Track])
    
    // Player Response Actions
    case trackLoadResponse(TaskResult<Void>)
    case playbackError(PlaybackError)
    
    // Delegate Actions
    case delegate(DelegateAction)
    
    enum PlaybackState: Equatable {
        case playing
        case paused
        case loading
        case error(String)
    }
    
    enum PlaybackError: Equatable {
        case trackUnavailable
        case networkError
        case unknown
    }
    
    enum DelegateAction: Equatable {
        case showFullPlayer
        case showQueue
        case showLyrics
    }
}