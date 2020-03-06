//
//  Network.swift
//  GitHubiOS
//
//  Created by Erick Kaique Da Silva on 03/03/20.
//  Copyright © 2020 Erick Kaique Da Silva. All rights reserved.
//

import Foundation

class Network: NetworkProtocol {
    
    
    var session: URLSession
    
    init(configuration: URLSessionConfiguration) {
        self.session = URLSession(configuration: configuration)
    }
    
    convenience init() {
        self.init(configuration: URLSessionConfiguration.default)
    }
    
    func request(endpoind: GithubEndPoint, completion: @escaping (Result<Data, Error>) -> Void) {
        
        let task = session.dataTask(with: createRequest(from: endpoind)) { data, response, error in
            
            DispatchQueue.main.sync {
                guard let httpResponse = response as? HTTPURLResponse else {
                    completion(.failure(error!))
                    return
                }
                
                guard httpResponse.statusCode == 200 else {
                    print(httpResponse.statusCode)
                    completion(.failure(ErrorNetwork.networkRequestFailure))
                    return
                }
                
                guard let data = data else {
                    completion(.failure(error!))
                    return
                }
                
                completion(.success(data))
            }
        }
        task.resume()
    }
    
    private func createRequest(from endPoint: GithubEndPoint) -> URLRequest {
        let url = URL(string: "\(endPoint.baseUrl)\(endPoint.path)")!
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = endPoint.method
        return urlRequest
    }
    
    private func decodingTask<T: Decodable>(data: Data) -> T? {
        return try? JSONDecoder().decode(T.self, from: data)
    }
}
