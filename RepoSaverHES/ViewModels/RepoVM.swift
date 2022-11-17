//
//  RepoVM.swift
//  RepoSaverHES
//
//  Created by Andres Gutierrez on 11/16/22.
//

import Foundation
import Moya

class RepoVM: ObservableObject {
    
    @Published var repos = [Repo]()
    let moya = MoyaTarget.instance
    
    init(){
        downloadRepos()
    }
    
    func downloadRepos() {
        moya.provider.request(.showRepos) { [weak self] result in
            switch result {
            case .success(let response):
                guard
                    let self = self,
                    let receivedRepos = try? response.map([Repo].self)
                else {
                    let status = response.statusCode
                    print(status)
                    print("🔥 Failed to map Repo")
                    return
                }
                self.repos = receivedRepos
            case .failure(let error):
                print("🔥 Error downloading Repos", error)
            }
        }
    }
}
