//
//  PodcastResponse.swift
//  PodcastAPI
//
//  Created by Burak Donat on 5.11.2020.
//  Copyright © 2020 Burak Donat. All rights reserved.
//

import Foundation

public enum APIRouter {
    case podcast
}

extension APIRouter: Routable {
    
    var baseURL: URL {
        return URL(fileURLWithPath: "https://rss.itunes.apple.com/api/v1/tr/podcasts/top-podcasts/all/25/explicit.json")
    }
    
    var path: String {
        switch self {
        case .podcast:
            return ""
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .podcast:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .podcast:
            return .plain
        }
    }
    
    var headers: Headers? {
        switch self {
        case .podcast:
            return ["Content-Type": "application/json"]
        }
    }
    
    var parametersEncoding: ParametersEncoding {
        return .json
    }
}
