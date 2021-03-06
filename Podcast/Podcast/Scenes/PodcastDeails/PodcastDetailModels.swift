//
//  PodcastDetailModels.swift
//  Podcast
//
//  Created by Burak Donat on 6.11.2020.
//  Copyright (c) 2020 Burak Donat. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit
import PodcastAPI

enum PodcastDetail {
    // MARK: Use cases
    
    enum FetchPodcast {
        struct Request {
        }
        struct Response {
            var podcasts: PodcastModel
        }
        struct ViewModel {
            struct DisplayedPodcast {
                var artistName: String
                var name: String
                var artworkUrl100: String
                var date: String
                var copyright: String
            }
            
            var displayedPocast: DisplayedPodcast
        }
    }
}
