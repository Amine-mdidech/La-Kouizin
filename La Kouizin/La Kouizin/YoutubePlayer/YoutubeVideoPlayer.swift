//
//  YoutubeVideoPlayer.swift
//  La Kouizin
//
//  Created by Amine Benchekroun on 14/6/2025.
//

import Foundation
import SwiftUI
import WebKit

struct YoutubeVideoPlayer: NSViewRepresentable {
    typealias NSViewType = WKWebView
    
    let videoURL: String
    let viewModel: YouTubePlayerViewModel
    
    func makeNSView(context: Context) -> WKWebView {
        let webView = WKWebView()
        return webView
    }

    func updateNSView(_ nsView: WKWebView, context: Context) {
        guard let videoID = viewModel.extractVideoID(from: videoURL) else { return }
            
        let embedHTML = """
            <!DOCTYPE html>
            <html>
            <head>
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <style>
                    body { margin: 0; padding: 0; background: black; }
                    .video-container {
                        position: relative;
                        width: 100%;
                        height: 100vh;
                        overflow: hidden;
                    }
                    .video-container iframe {
                        position: absolute;
                        top: 0;
                        left: 0;
                        width: 100%;
                        height: 100%;
                        border: none;
                    }
                </style>
            </head>
            <body>
                <div class="video-container">
                    <iframe src="https://www.youtube.com/embed/\(videoID)?autoplay=1&rel=0&modestbranding=1"
                            allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                            allowfullscreen>
                    </iframe>
                </div>
            </body>
            </html>
            """
        
        nsView.loadHTMLString(embedHTML, baseURL: nil)
    }
}
