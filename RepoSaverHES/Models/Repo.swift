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
        case description
        case language = "languages_url"
    }
    
    let id: Int?
    let fullName: String?
    let owner: Owner
    let description: String?
    let language: String?
    
}

extension Repo {
    
    static let example = Repo(id: 22, fullName: "caged/microsis", owner: Owner.example, description: "Treat an ActiveRecord model as a file attachment, storing its patch, size, content type, etc.", language: "https://api.github.com/repos/technoweenie/attachment_fu/languages")
    
}
