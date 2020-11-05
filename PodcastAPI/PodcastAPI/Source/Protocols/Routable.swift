//
//  Routable.swift
//  PodcastAPI
//
//  Created by Burak Donat on 5.11.2020.
//  Copyright © 2020 Burak Donat. All rights reserved.
//

import Foundation

typealias Headers = [String: String]

protocol Routable {
    var baseURL: URL { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var task: Task { get }
    var headers: Headers? { get }
    var parametersEncoding: ParametersEncoding { get }
}
