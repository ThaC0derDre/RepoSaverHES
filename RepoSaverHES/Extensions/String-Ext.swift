//
//  String-Ext.swift
//  RepoSaverHES
//
//  Created by Andres Gutierrez on 11/19/22.
//

import Foundation

extension String {
    var pathOnly: String {
            guard let splitUrl = self
                .components(separatedBy: ".com/")
                .last
        else { return self }
        return splitUrl.filter { $0 != "/"}
    }
}
