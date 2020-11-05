//
//  URLComponents+API.swift
//  TVShow-MVVMC
//
//  Created by Fikri Can Cankurtaran on 17.08.2019.
//  Copyright © 2019 Fikri Can Cankurtaran. All rights reserved.
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
