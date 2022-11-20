//
//  CacheManager.swift
//  RepoSaverHES
//
//  Created by Andres Gutierrez on 11/19/22.
//

import UIKit

class CacheManager {
    
    static let instance = CacheManager()
    
    private init() { }
    
    var imageCache: NSCache<NSString, UIImage> = {
        let cache = NSCache<NSString, UIImage>()
        cache.countLimit     = 200
        cache.totalCostLimit = 1024 * 1024 * 200 // 200mb
        return cache
    }()
    
    func addImage(image: UIImage, name: String) {
        imageCache.setObject(image, forKey: name as NSString)
    }
    
    
    func getImage(name: String) -> UIImage? {
        imageCache.object(forKey: name as NSString)
    }
}
