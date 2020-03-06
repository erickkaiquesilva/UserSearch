//
//  NetworkProtocol.swift
//  GitHubiOS
//
//  Created by Erick Kaique Da Silva on 03/03/20.
//  Copyright © 2020 Erick Kaique Da Silva. All rights reserved.
//

import Foundation

protocol NetworkProtocol {
    func request(endpoind: GithubEndPoint, completion: @escaping (Result<Data, Error>) -> Void)
}
