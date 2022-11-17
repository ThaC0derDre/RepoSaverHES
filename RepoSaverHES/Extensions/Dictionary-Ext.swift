//
//  Dictionary-Ext.swift
//  RepoSaverHES
//
//  Created by Andres Gutierrez on 11/16/22.
//

import Foundation

extension Dictionary {
    
    func mostUsedLang() -> String {
        var topLanguage = ""
        
        guard let myDict = self as? [String:Int] else { return "" }
        let mySortedDict = myDict.sorted { $0.1 > $1.1 }
        topLanguage = mySortedDict.first?.key ?? "Unknown"
        
        return topLanguage
    }
}
