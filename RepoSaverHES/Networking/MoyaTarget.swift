//
//  MoyaTarget.swift
//  RepoSaverHES
//
//  Created by Andres Gutierrez on 11/16/22.
//

import Foundation
import Moya

class MoyaTarget {
    static let instance = MoyaTarget()
    let provider = MoyaProvider<RepoService>()
    let prvder = MoyaProvider<AvatarService>()
    
    private init() { }
}
