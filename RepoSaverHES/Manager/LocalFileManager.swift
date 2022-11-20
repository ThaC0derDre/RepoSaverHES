//
//  LocalFileManager.swift
//  RepoSaverHES
//
//  Created by Andres Gutierrez on 11/19/22.
//

import UIKit

class LocalFileManager {
    static let instance    = LocalFileManager()
    private let folderName = "RepoSaver_Images"
    
    private init() {
        createFolderIfNeeded()
    }
    
    
    func createFolderIfNeeded() {
        guard
            let path = FileManager
                .default
                .urls(for: .cachesDirectory, in: .userDomainMask)
                .first?
                .appendingPathComponent(folderName)
                .path else { return }
        
        if !FileManager.default.fileExists(atPath: path) {
            do {
                try FileManager.default.createDirectory(atPath: path, withIntermediateDirectories: true)
            } catch let error {
                print("Error creating path", error)
            }
        }
    }
    
    
    func saveImage(image: UIImage, name: String) {
        guard
            let data = image.pngData(),
            let path = getPathForImage(name: name)
        else {
            print("Failed getting data from Image.")
            return
        }
        
        do {
            try data.write(to: path)
        } catch let error {
            print("Error saving Image:", error)
        }
    }
    
    
    func getImage(name: String) -> UIImage? {
        guard
            let path = getPathForImage(name: name)?.path,
            FileManager.default.fileExists(atPath: path) else {
            print("Failed getting path")
            return nil
        }
        return UIImage(contentsOfFile: path)
    }
    
    
    func deleteImage(name: String) {
        guard
            let path = getPathForImage(name: name)?.path,
            FileManager.default.fileExists(atPath: path) else {
            print("Failed getting path")
            return
        }
        
        do{
            try FileManager.default.removeItem(atPath: path)
        } catch let error {
            print("Error deleting image", error)
        }
    }
    
    
    func getPathForImage(name: String) -> URL? {
        guard let path = FileManager
            .default
            .urls(for: .cachesDirectory, in: .userDomainMask)
            .first?
            .appendingPathComponent(folderName)
            .appendingPathComponent("\(name).png") else {
            print("Failed getting path")
            return nil
        }
        return path
    }
}
