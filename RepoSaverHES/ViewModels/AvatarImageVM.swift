//
//  AvatarImageVM.swift
//  RepoSaverHES
//
//  Created by Andres Gutierrez on 11/18/22.
//

import UIKit
import Alamofire
import AlamofireImage

class AvatarImageVM: ObservableObject {
    @Published var avatarImage: UIImage? = nil
    @Published var isLoading = false
    
    var avatarUrl: String
    
    init(owner: Owner) {
        self.avatarUrl = owner.avatarUrl
        getImages()
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
    
}
