//
//  Favorite.swift
//  RepoSaverHES
//
//  Created by Andres Gutierrez on 11/16/22.
//

import UIKit
import RealmSwift

class Favorite: Object, ObjectKeyIdentifiable {
    
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var avatar: String // Need this to be image
    @Persisted var name: String
    @Persisted var descrp: String
    @Persisted var language: String
    
    convenience init(avatar: String, name: String, descrp: String, language: String) {
        self.init()
        self.avatar = avatar
        self.name = name
        self.descrp = descrp
        self.language = language
    }
    
}
