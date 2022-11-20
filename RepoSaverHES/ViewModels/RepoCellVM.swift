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
    @Published var avatarImage: UIImage? = nil
    @Published var isLoading = false
    
    let manager = LocalFileManager.instance
    let moya = MoyaTarget.instance
    
    var languageUrl: String
    var avatarUrl: String
    
    
    init(repo: Repo) {
        self.languageUrl = repo.language ?? ""
        self.avatarUrl = repo.owner.avatarUrl
        getLanguage()
        getImages()
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
    
    
    func getImages() {
        isLoading = true
        let headers: HTTPHeaders = [ "Authorization": "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"]
        AF
            .request(avatarUrl,headers: headers)
            .validate()
            .responseImage { [weak self] response in
                switch response.result {
                case .success(let returnedImage):
                    self?.avatarImage = returnedImage
                    self?.isLoading = false
                case .failure(let error):
                    print("Error", error)
                    self?.isLoading = false
                }
            }
    }
    
    //MARK: - File Manager Storage Functions

    
    func saveImage() {
        if let avatarImage {
            manager.saveImage(image: avatarImage, name: avatarUrl.pathOnly)
        }
    }
//
//    func getImageFromStorage() {
//        avatarImage = manager.getImage(name: avatarUrl.pathOnly)
//    }

    func deleteImage() {
        manager.deleteImage(name: avatarUrl.pathOnly)
    }
    
}
