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
}

extension RepoService: TargetType {
    var baseURL: URL {
        URL(string: "https://api.github.com")!
    }
    
    var path: String {
        switch self {
        case .showRepos:
            return "/repositories"
        case .selectedRepo(let url), .grabLanguage(let url):
            let splitUrl = url.components(separatedBy: ".com")
            return splitUrl.last!
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .showRepos,
             .selectedRepo ,
             .grabLanguage:
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Moya.Task {
        switch self {
        case .showRepos,
             .selectedRepo,
             .grabLanguage:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return ["Authorization": "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"]
    }
    
}