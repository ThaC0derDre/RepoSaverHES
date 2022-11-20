//
//  RepoCellVM.swift
//  RepoSaverHES
//
//  Created by Andres Gutierrez on 11/16/22.
//

import AlamofireImage
import Alamofire
import UIKit
import Moya

class RepoCellVM: ObservableObject {
    @Published var showAlert = false
    @Published var language: String?
    @Published var avatarImage: UIImage? = nil
    @Published var errorMessage: ErrorMessage?
    
    let fileManager  = LocalFileManager.instance
    let cacheManager = CacheManager.instance
    let moya         = MoyaTarget.instance
    
    var languageUrl: String
    var avatarUrl: String
    
    
    init(repo: Repo) {
        self.languageUrl = repo.language ?? ""
        self.avatarUrl = repo.owner.avatarUrl
        getImages()
        getLanguage()
    }
    
    
    func getImages() {
        if let cachedImage = cacheManager.getImage(name: avatarUrl) {
            avatarImage = cachedImage
        } else {
            downloadImages()
        }
    }
    
    //Compromised on learning: Downloading images with Moya 😅⏰
    func downloadImages() {
        let headers: HTTPHeaders = [ "Authorization": OAuthToken.token.rawValue]
        AF
            .request(avatarUrl,headers: headers)
            .validate()
            .responseImage { [weak self] response in
                guard let self = self else { return }
                switch response.result {
                case .success(let returnedImage):
                    self.avatarImage = returnedImage
                    self.cacheManager.addImage(image: returnedImage,
                                               name: self.avatarUrl)
                case .failure(let error):
                    self.errorOccurred(error: .invalidResponse)
                    print("Error", error)
                }
            }
    }
    
    
    func getLanguage() {
        moya.provider.request(.grabLanguage(url: languageUrl)) { [weak self] result in
            switch result {
            case .success(let response):
                guard
                    let self = self,
                    let receivedLanguage = try? response.map([String: Int].self)
                else {
                    self?.errorOccurred(error: .fetchLimitExceeded)
                    return
                }
                
                self.language = receivedLanguage.mostUsedLang()
                
                
            case .failure(let error):
                self?.errorOccurred(error: .noNetwork)
                print("Error fetching Language:", error)
            }
        }
    }
    
        func errorOccurred(error: ErrorMessage) {
            errorMessage  = error
            showAlert     = true
        }
    
    
    //MARK: - FileManager Storage Functions
    
    func saveImage() {
        if let avatarImage {
            fileManager.saveImage(image: avatarImage, name: avatarUrl.pathOnly)
        }
    }
    
    
    func deleteImage() {
        fileManager.deleteImage(name: avatarUrl.pathOnly)
    }
}
