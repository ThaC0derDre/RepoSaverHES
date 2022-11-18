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
    @Published var searchFor = ""
    let moya = MoyaTarget.instance
    
    init(){
//        downloadRepos()
        searchRepo()
    }
    
    
    func searchRepo() {
        if searchFor.isEmpty { return }
        
        moya.provider.request(.searchForRepo(query: searchFor)) { [weak self] result in
            switch result {
            case .success(let response):
                guard
                    let self = self,
                    let receivedRepos = try? response.map(Item.self)
                else {
                    print("🔥 Failed to map searched Repo")
                    return
                }
                
                self.repos = receivedRepos.items
                
            case .failure(let error):
                print("Error searching Repo:", error)
            }
        }
    }
    
    func downloadRepos() {
        if searchFor.count > 2 { return }
        
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
