//
//  RootView.swift
//  Spotify-TCA
//
//  Created by SownFrenky on 2/16/25.
//


import SwiftUI
import ComposableArchitecture

struct RootView: View {
    let store: StoreOf<AppReducer>
    
    var body: some View {
        WithViewStore(store, observe: \.selectedTab) { viewStore in
            ZStack {
                TabView(selection: viewStore.binding(
                    get: { $0 },
                    send: AppAction.selectTab
                )) {
                    HomeView(
                        store: store.scope(
                            state: \.home,
                            action: AppAction.home
                        )
                    )
                    .tabItem {
                        Image(systemName: "house")
                        Text("Home")
                    }
                    .tag(Tab.home)
                    
                    // TODO: Implement SearchView
                    Text("Search")
                        .tabItem {
                            Image(systemName: "magnifyingglass")
                            Text("Search")
                        }
                        .tag(Tab.search)
                    
                    // TODO: Implement LibraryView
                    Text("Library")
                        .tabItem {
                            Image(systemName: "music.note.list")
                            Text("Library")
                        }
                        .tag(Tab.library)
                    
                    // TODO: Implement ProfileView
                    Text("Profile")
                        .tabItem {
                            Image(systemName: "person")
                            Text("Profile")
                        }
                        .tag(Tab.profile)
                }
                
                // Mini Player overlay at bottom
                VStack {
                    Spacer()
                }
            }
        }
    }
}
