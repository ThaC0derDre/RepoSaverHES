//
//  Favorite.swift
//  RepoSaverHES
//
//  Created by Andres Gutierrez on 11/16/22.
//

import RealmSwift
import UIKit

class Favorite: Object, ObjectKeyIdentifiable {
    
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var avatar: String
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
