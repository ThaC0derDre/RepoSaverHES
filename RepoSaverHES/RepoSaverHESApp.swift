//
//  RepoSaverHESApp.swift
//  RepoSaverHES
//
//  Created by Andres Gutierrez on 11/16/22.
//

import SwiftUI

@main
struct RepoSaverHESApp: App {
    var body: some Scene {
        WindowGroup {
            RepoListView()
                .preferredColorScheme(.light)
        }
    }
}
