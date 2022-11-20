//
//  FavoriteVM.swift
//  RepoSaverHES
//
//  Created by Andres Gutierrez on 11/19/22.
//

import UIKit

class FavoriteVM: ObservableObject {
    let manager = LocalFileManager.instance
    
    
    func getImageFromStorage(avatarPath: String) -> UIImage? {
         manager.getImage(name: avatarPath)
    }
    
    
    func deleteImage(avatarPath: String) {
        manager.deleteImage(name: avatarPath)
    }
    
}
