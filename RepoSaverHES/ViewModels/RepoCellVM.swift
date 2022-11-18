//
//  RepoCellVM.swift
//  RepoSaverHES
//
//  Created by Andres Gutierrez on 11/16/22.
//

import Moya
import UIKit
import Alamofire
import AlamofireImage

class RepoCellVM: ObservableObject {
    
    @Published var language: String?
    
    let moya = MoyaTarget.instance
    
    var languageUrl: String
    
    
    init(repo: Repo) {
        self.languageUrl = repo.language ?? ""
        getLanguage()
    }
    
    
    func getLanguage() {
        moya.provider.request(.grabLanguage(url: languageUrl)) { [weak self] result in
            switch result {
            case .failure(let error):
                print("Error fetching Language:", error)
            case .success(let response):
                guard
                    let self = self,
                    let receivedLanguage = try? response.map([String: Int].self)
                else {
                    print("🔥 Failed to map language")
                    return
                }
                
                self.language = receivedLanguage.mostUsedLang()
            }
        }
    }
    
}
