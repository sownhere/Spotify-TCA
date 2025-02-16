struct RecommendationsSection: View {
    let tracks: [Track]
    let onTrackSelected: (Track) -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Recommended for You")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.horizontal)
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 16) {
                    ForEach(tracks) { track in
                        TrackCard(track: track)
                            .onTapGesture {
                                onTrackSelected(track)
                            }
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}