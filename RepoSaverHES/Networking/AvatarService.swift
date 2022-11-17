//
//  AvatarService.swift
//  RepoSaverHES
//
//  Created by Andres Gutierrez on 11/17/22.
//

import Foundation
import Moya

enum AvatarService {
    case grabAvatarImage(url: String)
}

extension AvatarService: TargetType {
    var baseURL: URL {
        URL(string: "https://avatars.githubusercontent.com/u/")!
    }
    
    var path: String {
        switch self {
        case .grabAvatarImage(let url):
            let splitUrl = url.components(separatedBy: "u/")
            return splitUrl.last!
        }
    }
    
    var method: Moya.Method { .get }
    
    var sampleData: Data { return Data() }
    
    var task: Moya.Task { .requestPlain }
    
    var headers: [String : String]? {
        return ["Authorization": "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"]
    }
    
}
