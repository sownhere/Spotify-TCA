//
//  ProfileAction.swift
//  Spotify-TCA
//
//  Created by SownFrenky on 2/16/25.
//


enum ProfileAction: Equatable {
    // View Actions
    case onAppear
    case settingsTapped
    case editProfileTapped
    case logoutTapped
    case followersButtonTapped
    case followingButtonTapped
    
    // Internal Actions
    case _fetchUserProfile
    case _fetchUserStats
    case _updateProfile(ProfileUpdateRequest)
    
    // API Response Actions
    case profileResponse(TaskResult<UserProfile>)
    case statsResponse(TaskResult<UserStats>)
    case updateProfileResponse(TaskResult<Void>)
    
    // Delegate Actions
    case delegate(DelegateAction)
    
    struct ProfileUpdateRequest: Equatable {
        var displayName: String
        var bio: String
        var imageURL: URL?
    }
    
    struct UserStats: Equatable {
        var followersCount: Int
        var followingCount: Int
        var playlistCount: Int
    }
    
    enum DelegateAction: Equatable {
        case showSettings
        case showFollowers
        case showFollowing
        case loggedOut
    }
}