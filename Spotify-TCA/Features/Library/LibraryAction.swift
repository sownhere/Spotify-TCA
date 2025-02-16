enum LibraryAction: Equatable {
    // View Actions
    case onAppear
    case tabSelected(LibraryTab)
    case sortOptionSelected(SortOption)
    case playlistSelected(Playlist)
    case albumSelected(Album)
    case artistSelected(Artist)
    
    // Internal Actions
    case _fetchUserLibrary
    case _fetchPlaylists
    case _fetchSavedAlbums
    case _fetchFollowedArtists
    
    // API Response Actions
    case playlistsResponse(TaskResult<[Playlist]>)
    case albumsResponse(TaskResult<[Album]>)
    case artistsResponse(TaskResult<[Artist]>)
    
    // Delegate Actions
    case delegate(DelegateAction)
    
    enum LibraryTab: Equatable {
        case playlists
        case albums
        case artists
    }
    
    enum SortOption: Equatable {
        case recentlyAdded
        case alphabetical
        case creator
    }
    
    enum DelegateAction: Equatable {
        case openPlaylist(Playlist)
        case openAlbum(Album)
        case openArtist(Artist)
    }
}