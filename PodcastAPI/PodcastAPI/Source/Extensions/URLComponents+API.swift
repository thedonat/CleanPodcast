//
//  URLComponents+API.swift
//  PodcastAPI
//
//  Created by Burak Donat on 5.11.2020.
//  Copyright © 2020 Burak Donat. All rights reserved.
//

import Foundation

extension URLComponents {
    
    init(router: Routable) {
        let url = router.baseURL.appendingPathComponent(router.path)
        self.init(url: url, resolvingAgainstBaseURL: false)!
        
        guard case let .parameters(parameters) = router.task, router.parametersEncoding == .url else { return }
        
        queryItems = parameters.map { key, value in
            return URLQueryItem(name: key, value: String(describing: value))
        }
    }
    
}

private extension Int {

    init?(doubleVal: Double) {
        guard (doubleVal <= Double(Int.max).nextDown) && (doubleVal >= Double(Int.min).nextUp) else {
        return nil
    }

    self.init(doubleVal)
    }
}
