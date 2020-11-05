//
//  APIError.swift
//  PodcastAPI
//
//  Created by Burak Donat on 5.11.2020.
//  Copyright © 2020 Burak Donat. All rights reserved.
//

import Foundation

public enum APIError {
    case unknown
    case decodingError(Error)
    case noJSONData
    case errorMessage(String)
    case internalServer
    //TODO: Will add more cases
}
