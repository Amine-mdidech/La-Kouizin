//
//  YoutubePlayerView.swift
//  Bonchk Kouizin
//
//  Created by Amine Benchekroun on 11/6/2025.
//

import SwiftUI
import WebKit
import AVKit
import AppKit

struct YouTubeThumbnailView: View {
    @State var videoURL: String = ""
    @State private var showPlayer = false
    @StateObject private var YTViewModel = YouTubePlayerViewModel()
    
    var body: some View {
        ZStack {
            if YTViewModel.showPlayer {
                YoutubeVideoPlayer(videoURL: videoURL, viewModel: YTViewModel)
                    .cornerRadius(10)
                    .overlay(
                        Button(action: {
                            YTViewModel.closeVideo()
                        }) {
                            Image(systemName: "xmark.circle.fill")
                                .font(.system(size: 30))
                                .foregroundColor(.white)
                                .background(Color.black.opacity(0.7))
                                .clipShape(Circle())
                        }
                            .padding(10),
                        alignment: .topTrailing
                    )
            } else {
                if let image = YTViewModel.thumbnailImage {
                    Image(nsImage: image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .clipped()
                } else if YTViewModel.isLoading {
                    ProgressView()
                        .scaleEffect(1.5)
                } else {
                    Rectangle()
                        .fill(Color.gray.opacity(0.3))
                }
                
                Button(action: {
                        YTViewModel.playVideo(from: videoURL)
                }) {
                    Image(systemName: "play.circle.fill")
                        .font(.system(size: 60))
                        .foregroundColor(.white)
                        .background(Color.black.opacity(0.5))
                        .clipShape(Circle())
                }
                .buttonStyle(PlainButtonStyle())
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black)
        .cornerRadius(10)
        .onAppear {
            Task {
                await YTViewModel.loadThumbnail(from: videoURL)
            }
        }
    }
}
