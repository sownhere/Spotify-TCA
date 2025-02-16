//
//  RecentlyPlayedSection.swift
//  Spotify-TCA
//
//  Created by SownFrenky on 2/16/25.
//


import SwiftUI

struct RecentlyPlayedSection: View {
    let tracks: [Track]
    let onTrackSelected: (Track) -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Recently Played")
                .font(.title2)
                .fontWeight(.bold)
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 12) {
                    ForEach(tracks) { track in
                        TrackCard(track: track)
                            .onTapGesture {
                                onTrackSelected(track)
                            }
                    }
                }
            }
        }
    }
}