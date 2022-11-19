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
    @Published var isLoading = false
    let moya = MoyaTarget.instance
    
    init(){
//        downloadRepos()
        searchRepo()
    }
    
    
    func searchRepo() {
        if searchFor.isEmpty { return }
        isLoading = true
        moya.provider.request(.searchForRepo(query: searchFor)) { [weak self] result in
            switch result {
            case .success(let response):
                self?.isLoading = false
                guard
                    let self = self,
                    let receivedRepos = try? response.map(Item.self)
                else {
                    print("🔥 Failed to map searched Repo")
                    return
                }
                
                self.repos = receivedRepos.items
                
            case .failure(let error):
                self?.isLoading = false
                print("Error searching Repo:", error)
            }
        }
        searchFor = ""
    }
    
    func downloadRepos() {
        isLoading = true
        if searchFor.count > 2 { return }
        
        moya.provider.request(.showRepos) { [weak self] result in
            switch result {
            case .success(let response):
                self?.isLoading = false
                guard
                    let self = self,
                    let receivedRepos = try? response.map([Repo].self)
                else {
                    let status = response.statusCode
                    print(status)
                    print("🔥 Failed to map Repo")
                    if let jsonResponse = try? response.mapJSON() {
                        print(jsonResponse)
                    }
                    return
                }
                
                self.repos = receivedRepos
                
            case .failure(let error):
                self?.isLoading = false
                print("🔥 Error downloading Repos", error)
            }
        }
    }
}
