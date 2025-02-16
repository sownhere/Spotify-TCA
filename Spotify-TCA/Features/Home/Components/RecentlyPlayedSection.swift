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

struct TrackCard: View {
    let track: Track
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Image(systemName: "music.note")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
                .cornerRadius(8)
            
            Text(track.title)
                .font(.headline)
                .fontWeight(.semibold)
            
            Text(track.artist)
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
        .frame(width: 150)
    }
}



