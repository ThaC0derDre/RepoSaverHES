//
//  RepoVM.swift
//  RepoSaverHES
//
//  Created by Andres Gutierrez on 11/16/22.
//

import Foundation
import Moya

class RepoVM: ObservableObject {
    @Published var repos     = [Repo]()
    @Published var searchFor = ""
    @Published var isLoading = false
    @Published var showAlert = false
    @Published var errorMessage: ErrorMessage?
    
    let moya     = MoyaTarget.instance
    let mananger = CacheManager.instance
    
    init(){
        downloadRepos()
        searchRepo()
    }
    
    
    func searchRepo() {
        if searchFor.isEmpty { return }
        if errorMessage != nil {
            showAlert = true
            return
        }
        
        isLoading = true
        moya.provider.request(.searchForRepo(query: searchFor)) { [weak self] result in
            switch result {
            case .success(let response):
                guard
                    let self = self,
                    let receivedRepos = try? response.map(Item.self)
                else {
                    self?.isLoading    = false
                    self?.errorMessage = .fetchLimitExceeded
                    self?.showAlert    = true
                    return
                }
                
                self.repos = receivedRepos.items
                
            case .failure(_):
                self?.isLoading    = false
                self?.errorMessage = .noNetwork
                self?.showAlert    = true
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
                if response.statusCode >= 200 && response.statusCode < 300 {
                    guard
                        let self = self,
                        let receivedRepos = try? response.map([Repo].self)
                    else {
                        self?.errorOccurred(error: .fetchLimitExceeded)
                        return
                    }
                    
                    self.repos     = receivedRepos
                    self.isLoading = false
                } else {
                    self?.errorOccurred(error: .invalidResponse)
                    print("issue here")
                }
                
            case .failure(_):
                self?.errorOccurred(error: .noNetwork)
            }
        }
    }
    
    func errorOccurred(error: ErrorMessage) {
        isLoading     = false
        errorMessage  = error
        showAlert     = true
    }
}
