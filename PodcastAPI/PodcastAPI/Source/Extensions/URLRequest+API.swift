//
//  URLRequest+API.swift
//  TVShow-MVVMC
//
//  Created by Fikri Can Cankurtaran on 17.08.2019.
//  Copyright © 2019 Fikri Can Cankurtaran. All rights reserved.
//

import Foundation

extension URLRequest {
    
    init(router: Routable) {
        let urlComponents = URLComponents(router: router)
        
        self.init(url: urlComponents.url!)
        
        httpMethod = router.method.rawValue
        router.headers?.forEach { key, value in
            addValue(value, forHTTPHeaderField: key)
        }
        
        guard case let .parameters(parameters) = router.task, router.parametersEncoding == .json else { return }
        httpBody = try? JSONSerialization.data(withJSONObject: parameters)
    }
    
}


public extension URLRequest {

    /// Returns a cURL command for a request
    /// - return A String object that contains cURL command or "" if an URL is not properly initalized.
    var cURL: String {

        guard
            let url = url,
            let httpMethod = httpMethod,
            url.absoluteString.utf8.count > 0
        else {
                return ""
        }

        var curlCommand = "curl --verbose \\\n"

        // URL
        curlCommand = curlCommand.appendingFormat(" '%@' \\\n", url.absoluteString)

        // Method if different from GET
        if "GET" != httpMethod {
            curlCommand = curlCommand.appendingFormat(" -X %@ \\\n", httpMethod)
        }

        // Headers
        let allHeadersFields = allHTTPHeaderFields!
        let allHeadersKeys = Array(allHeadersFields.keys)
        let sortedHeadersKeys  = allHeadersKeys.sorted(by: <)
        for key in sortedHeadersKeys {
            curlCommand = curlCommand.appendingFormat(" -H '%@: %@' \\\n", key, self.value(forHTTPHeaderField: key)!)
        }

        // HTTP body
        if let httpBody = httpBody, httpBody.count > 0 {
            let httpBodyString = String(data: httpBody, encoding: String.Encoding.utf8)!
            let escapedHttpBody = URLRequest.escapeAllSingleQuotes(httpBodyString)
            curlCommand = curlCommand.appendingFormat(" --data '%@' \\\n", escapedHttpBody)
        }

        return curlCommand
    }

    /// Escapes all single quotes for shell from a given string.
    static func escapeAllSingleQuotes(_ value: String) -> String {
        return value.replacingOccurrences(of: "'", with: "'\\''")
    }
}
