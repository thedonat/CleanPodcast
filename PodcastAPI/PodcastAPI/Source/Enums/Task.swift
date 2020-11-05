//
//  PodcastResponse.swift
//  PodcastAPI
//
//  Created by Burak Donat on 5.11.2020.
//  Copyright © 2020 Burak Donat. All rights reserved.
//

import Foundation

typealias Parameters = [String: Any]

enum Task {
    case plain
    case parameters(Parameters)
    //TODO: Will add download and upload tasks
}
