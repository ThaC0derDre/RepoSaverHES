//
//  Repo.swift
//  RepoSaverHES
//
//  Created by Andres Gutierrez on 11/16/22.
//

import Foundation

struct Repo: Codable, Identifiable {
    enum CodingKeys: String, CodingKey {
        case id
        case fullName = "full_name"
        case owner
        case url
        case description
        case languages = "languages_url"
        case contributors = "contributors_url"
    }
    
    let id: Int?
    let fullName: String?
    let owner: Owner
    let url: String
    let description: String?
    let languages: String?
    let contributors: String?
    
}

