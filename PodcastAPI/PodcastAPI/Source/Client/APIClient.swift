//
//  APIClient.swift
//  PodcastAPI
//
//  Created by Burak Donat on 5.11.2020.
//  Copyright © 2020 Burak Donat. All rights reserved.
//

import Foundation

extension Foundation.Notification.Name {
    static let didReceive401 = Foundation.Notification.Name("didReceiveUnauthorizedError")
}

final class APIClient {
    
    typealias DataTaskResult = (Data?, URLResponse?, Error?) -> ()
    
    private var session: URLSession = URLSession.shared
    
    private var unauthorizedNotification = Foundation.Notification(name: .didReceive401)
    
    static var shared = APIClient()
    
    func request<T>(responseType: T.Type, router: Routable, completion: @escaping (APIResponse<T>) -> ()) where T: Decodable {
        
        let request = URLRequest(router: router)
        
        let task = session.dataTask(with: request, completionHandler: { [weak self] data, response, error in
            
            DispatchQueue.main.async {
                let httpResponse = response as? HTTPURLResponse
                self?.handleDataResponse(data: data, response: httpResponse, error: error, completion: completion)
            }
            
        })
        print(request.cURL)
        task.resume()
        
    }
    
    private func handleDataResponse<T: Decodable>(data: Data?, response: HTTPURLResponse?, error: Error?, completion: (APIResponse<T>) -> ()) {
        
        guard error == nil else {
            return completion(.failure(.unknown)) 
        }
        guard let response = response else { return completion(.failure(.noJSONData)) }
        
        if response.statusCode == 401 {
            NotificationCenter.default.post(unauthorizedNotification)
        }
        
        switch response.statusCode {
        case 200...299:
            guard let data = data else { return completion(.failure(.unknown)) }
            
            do {
                let baseResponse = try JSONDecoder().decode(T.self, from: data)
                completion(.success(baseResponse))
                
            } catch let error {
                return completion(.failure(.decodingError(error)))
            }
        case 400...499:
            guard data != nil else { return completion(.failure(.unknown)) }
            completion(.failure(.errorMessage("\(String(describing: data))")))
        default:
            completion(.failure(.unknown))
        }
        
    }
}
