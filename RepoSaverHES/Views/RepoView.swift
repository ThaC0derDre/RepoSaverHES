//
//  RepoView.swift
//  RepoSaverHES
//
//  Created by Andres Gutierrez on 11/16/22.
//

import SwiftUI

struct RepoView: View {
    
    @StateObject private var vm = RepoVM()
    
    var body: some View {
        NavigationView {
            GeometryReader { proxy in
                VStack(spacing: 0) {
                    RepoHeader(proxy: proxy)
                    RepoSearchBar(proxy: proxy)
                    ScrollView {
                        VStack(spacing: 0) {
                            //                        ForEach(vm.repos) { repo in
                            RepoCell(repo: Repo.example)
                            boarder
                            RepoCell(repo: Repo.example)
                        }
                        //                    }
                    }
                }
                .ignoresSafeArea()
            }
        }
    }
}

struct RepoView_Previews: PreviewProvider {
    static var previews: some View {
        RepoView()
    }
}

extension RepoView {
    private var boarder: some View {
        Rectangle()
            .frame(height: 1)
            .ignoresSafeArea()
            .frame(maxWidth: .infinity)
            .foregroundColor(.secondary.opacity(0.3))
    }
}
