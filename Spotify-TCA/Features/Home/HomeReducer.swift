import ComposableArchitecture
import Foundation

struct HomeReducer: Reducer {
    struct Environment {
        let mainQueue: AnySchedulerOf<DispatchQueue>
        let musicClient: MusicClientProtocol
    }
    
    var body: some Reducer<HomeState, HomeAction> {
        Reduce { state, action in
            switch action {
            case .onAppear:
                return .send(._fetchHomeData)
                
            case .onRefresh:
                state.isLoading = true
                return .merge(
                    .send(._fetchRecentlyPlayed),
                    .send(._fetchFeaturedPlaylists),
                    .send(._fetchRecommendations)
                )
                
            case ._fetchHomeData:
                state.isLoading = true
                return .run { send in
                    await send(.homeDataResponse(
                        TaskResult { try await environment.musicClient.fetchHomeData() }
                    ))
                }
                
            case .homeDataResponse(.success(let data)):
                state.isLoading = false
                state.data = data
                return .none
                
            case .homeDataResponse(.failure(let error)):
                state.isLoading = false
                state.error = error.localizedDescription
                state.showErrorAlert = true
                return .none
                
            case .trackSelected(let track):
                state.selectedTrack = track
                return .send(.delegate(.playTrack(track)))
                
            case .playlistSelected(let playlist):
                state.selectedPlaylist = playlist
                return .send(.delegate(.openPlaylist(playlist)))
                
            case .dismissErrorAlert:
                state.showErrorAlert = false
                state.error = nil
                return .none
                
            // Handle other cases...
                
            default:
                return .none
            }
        }
    }
}