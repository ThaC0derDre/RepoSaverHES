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
    
    @Published var avatarImage: UIImage? = nil
    @Published var language: String?
    
    let moya = MoyaTarget.instance
    
    var avatarUrl: String
    var languageUrl: String
    
    init(repo: Repo) {
        self.avatarUrl = repo.owner.avatarUrl
        self.languageUrl = repo.language ?? ""
        getImages()
        getLanguage()
    }
    
        func getImages() {
            let headers: HTTPHeaders = [ "Authorization": "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"]
            AF
                .request(avatarUrl,headers: headers)
                .validate()
                .responseImage { [weak self] response in
                    switch response.result {
                    case .success(let returnedImage):
                        self?.avatarImage = returnedImage
                    case .failure(let error):
                        print("Error", error)
                    }
                }
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
