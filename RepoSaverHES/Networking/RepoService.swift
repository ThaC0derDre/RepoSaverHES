//
//  RepoService.swift
//  RepoSaverHES
//
//  Created by Andres Gutierrez on 11/16/22.
//

import Foundation
import Moya

enum RepoService {
    case showRepos
    case selectedRepo(url: String)
    case grabLanguage(url: String)
    case searchForRepo(query: String)
}

// https://api.github.com/search/repositories?q=swiftin:name,description

extension RepoService: TargetType {
    
    var baseURL: URL { URL(string: "https://api.github.com")! }
    
    var path: String {
        switch self {
        case .showRepos:
            return "/repositories"
            
        case .selectedRepo(let url),
                .grabLanguage(let url):
            let splitUrl = url.components(separatedBy: ".com")
            return splitUrl.last!
            
        case .searchForRepo:
            return "/search/repositories"
        }
    }
    
    
    var method: Moya.Method {
        switch self {
        case .showRepos,
             .selectedRepo,
             .grabLanguage,
             .searchForRepo:
            return .get
        }
    }
    
    
    var sampleData: Data { Data() }
    
    
    var task: Moya.Task {
        switch self {
        case .searchForRepo(let query):
            return .requestParameters(
                parameters: ["q": query,
                             "in":"name,description"],
                encoding: URLEncoding.default)
        default:
            return .requestPlain
        }
    }
    
    
    var headers: [String : String]? {
        return ["Authorization": "dc9cf1330ccca7b454d5414347c2f69d09420cdb"]
    }
}

// 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
// `dc9cf1330ccca7b454d5414347c2f69d09420cdb`
