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
                    
                    SearchView(
                        store: store.scope(
                            state: \.search,
                            action: AppAction.search
                        )
                    )
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                        Text("Search")
                    }
                    .tag(Tab.search)
                    
                    LibraryView(
                        store: store.scope(
                            state: \.library,
                            action: AppAction.library
                        )
                    )
                    .tabItem {
                        Image(systemName: "books.vertical")
                        Text("Library")
                    }
                    .tag(Tab.library)
                }
                
                // Mini Player overlay at bottom
                VStack {
                    Spacer()
                    PlayerView(
                        store: store.scope(
                            state: \.player,
                            action: AppAction.player
                        )
                    )
                }
            }
        }
    }
}