//
//  Owner.swift
//  RepoSaverHES
//
//  Created by Andres Gutierrez on 11/16/22.
//

import Foundation

struct Owner: Codable, Identifiable {
    enum CodingKeys: String, CodingKey {
        case id
        case avatarUrl = "avatar_url"
    }
    
    let id: Int
    let avatarUrl: String
    
}
