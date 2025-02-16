//
//  AppReducer.swift
//  Spotify-TCA
//
//  Created by SownFrenky on 2/16/25.
//

struct AppReducer: Reducer {
    struct State: Equatable {
        var tabBar = TabBar.State()
        var player = Player.State()
        var home = Home.State()
        var search = Search.State()
        var library = Library.State()
    }
    
    enum Action {
        case tabBar(TabBar.Action)
        case player(Player.Action)
        case home(Home.Action)
        case search(Search.Action)
        case library(Library.Action)
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case let .player(action):
                if case .setTrack(let track) = action {
                    state.player.currentTrack = track
                }
                return .none
            default:
                return .none
            }
        }
        
        Scope(state: \.tabBar, action: /Action.tabBar) {
            TabBar()
        }
        Scope(state: \.player, action: /Action.player) {
            Player()
        }
        Scope(state: \.home, action: /Action.home) {
            Home()
        }
        Scope(state: \.search, action: /Action.search) {
            Search()
        }
        Scope(state: \.library, action: /Action.library) {
            Library()
        }
    }
}
