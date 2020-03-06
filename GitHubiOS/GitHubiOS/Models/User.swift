//
//  User.swift
//  GitHubiOS
//
//  Created by Erick Kaique Da Silva on 03/03/20.
//  Copyright © 2020 Erick Kaique Da Silva. All rights reserved.
//

import Foundation

struct User: Decodable {
    let id: Int
    let login: String
    let name: String
    let bio: String?
    let avatar_url: String
}
