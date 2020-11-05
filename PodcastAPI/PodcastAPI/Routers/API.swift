//
//  PodcastResponse.swift
//  PodcastAPI
//
//  Created by Burak Donat on 5.11.2020.
//  Copyright © 2020 Burak Donat. All rights reserved.
//

import Foundation

final public class API {
    
    public init() {}
    
    public let router = APIRouter.self
    
    public func getPodcasts(completion: @escaping (APIResponse<PodcastResponse>) -> ()) {
        APIClient.shared.request(responseType: PodcastResponse.self, router: router.podcast, completion: completion)
    }
}
