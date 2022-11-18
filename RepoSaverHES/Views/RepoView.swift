//
//  RepoView.swift
//  RepoSaverHES
//
//  Created by Andres Gutierrez on 11/16/22.
//

import SwiftUI

struct RepoView: View {
    
    @StateObject private var vm = RepoVM()
    @State var searching = false
    var body: some View {
        NavigationView {
            GeometryReader { proxy in
                VStack(spacing: 0) {
                    RepoHeader(proxy: proxy)
                    RepoSearchBar(textString: $vm.searchFor, searching: $searching, proxy: proxy)
                    ScrollView {
                        LazyVStack(spacing: 0) {
                            ForEach(vm.repos) { repo in
                                RepoCell(repo: repo)
                                boarder
                                //                            RepoCell(repo: Repo.example)
                            }
                        }
                    }
                }
                .onChange(of: searching, perform: { _ in
                    vm.searchRepo()
                })
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
