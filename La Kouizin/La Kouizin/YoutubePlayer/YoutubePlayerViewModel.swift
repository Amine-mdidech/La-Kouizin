//
//  YoutubePlayerViewModel.swift
//  La Kouizin
//
//  Created by Amine Benchekroun on 14/6/2025.
//

import Foundation
import AppKit
import SwiftUICore
import SwiftUI
import WebKit

class YouTubePlayerViewModel: ObservableObject {
    @Published var isLoading: Bool = false
    @Published var thumbnailImage: NSImage?
    @Published var showPlayer: Bool = false
    
    func extractVideoID(from url: String) -> String? {
        let patterns = [
            #"(?:youtube\.com\/watch\?v=)([a-zA-Z0-9_-]{11})"#,
            #"(?:youtu\.be\/)([a-zA-Z0-9_-]{11})"#,
            #"(?:youtube\.com\/embed\/)([a-zA-Z0-9_-]{11})"#
        ]
        
        for pattern in patterns {
            do {
                let regex = try NSRegularExpression(pattern: pattern, options: [])
                let nsString = url as NSString
                let results = regex.matches(in: url, options: [], range: NSRange(location: 0, length: nsString.length))
                
                if let match = results.first {
                    return nsString.substring(with: match.range(at: 1))
                }
            } catch {
                continue
            }
        }
        return nil
    }
    
    func loadThumbnail(from videoURL: String) async {
        guard let videoID = extractVideoID(from: videoURL) else {
            isLoading = false
            return
        }
        let thumbnailURL = "https://img.youtube.com/vi/\(videoID)/maxresdefault.jpg"
        await downloadImageThumbnail(from: thumbnailURL)
    }
    
    @MainActor
    private func downloadImageThumbnail(from thumbnailURL: String) async {
        isLoading = true
        guard let url = URL(string: thumbnailURL) else {
            isLoading = false
            return
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            guard let image = NSImage(data: data) else {
                return
            }
            thumbnailImage = image
        } catch {
            return
        }
        isLoading = false
    }
    
    func playVideo(from videoURL: String) {
        showPlayer = true
    }
    
    func closeVideo() {
        showPlayer = false
    }
}
