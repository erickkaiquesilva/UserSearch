//
//  GithubEndPoint.swift
//  GitHubiOS
//
//  Created by Erick Kaique Da Silva on 03/03/20.
//  Copyright © 2020 Erick Kaique Da Silva. All rights reserved.
//

import Foundation

enum GithubEndPoint {
    case user(String)
    case repos(String)
}

extension GithubEndPoint {
    
    var baseUrl: String {
        return "https://api.github.com/"
    }
    
    var path: String {
        switch self {
        case .user(let user):
            return "users/\(user)"
        case .repos(let user):
            return "users/\(user)/repos"
        }
    }
    
    var method: String {
        return "GET"
    }
}
