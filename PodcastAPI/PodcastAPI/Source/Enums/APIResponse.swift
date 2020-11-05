//
//  PodcastResponse.swift
//  PodcastAPI
//
//  Created by Burak Donat on 5.11.2020.
//  Copyright © 2020 Burak Donat. All rights reserved.
//

import Foundation

public enum APIResponse<T: Decodable> {
    case success(T)
    case failure(APIError)
}
