//
//  Podcast.swift
//  PodcastAPI
//
//  Created by Burak Donat on 5.11.2020.
//  Copyright © 2020 Burak Donat. All rights reserved.
//

import Foundation

public struct Podcast: Decodable {
    let artistName: String
    let name: String
    let artworkUrl100: String
}

