//
//  SearchAction.swift
//  Spotify-TCA
//
//  Created by SownFrenky on 2/16/25.
//


enum SearchAction: Equatable {
    // View Actions
    case onAppear
    case searchQueryChanged(String)
    case categorySelected(Category)
    case clearSearchHistory
    case resultSelected(SearchResult)
    
    // Internal Actions
    case _performSearch
    case _loadCategories
    case _saveToRecentSearches(String)
    
    // API Response Actions
    case searchResponse(TaskResult<SearchResults>)
    case categoriesResponse(TaskResult<[Category]>)
    
    // Delegate Actions
    case delegate(DelegateAction)
    
    enum DelegateAction: Equatable {
        case playTrack(Track)
        case openArtist(Artist)
        case openAlbum(Album)
        case openPlaylist(Playlist)
    }
    
    enum SearchResult: Equatable {
        case track(Track)
        case artist(Artist)
        case album(Album)
        case playlist(Playlist)
    }
}