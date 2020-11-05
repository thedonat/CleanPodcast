//
//  Podcast.swift
//  PodcastAPI
//
//  Created by Burak Donat on 5.11.2020.
//  Copyright © 2020 Burak Donat. All rights reserved.
//

import Foundation

public struct PodcastModel: Decodable {
    public let artistName: String
    public let name: String
    public let artworkUrl100: String
}

