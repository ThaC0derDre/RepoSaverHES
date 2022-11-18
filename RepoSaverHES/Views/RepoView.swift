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
            GeometryReader { proxy in
                VStack(spacing: 0) {
                    RepoHeader(proxy: proxy)
                    RepoSearchBar(textString: $vm.searchFor,
                                  searching: $searching,
                                  proxy: proxy)
                        if vm.isLoading {
                            loadingScreen
                        } else {
                            listOfRepos
                        }
                }
                .ignoresSafeArea()
            }
            .onChange(of: searching) { _ in
                vm.searchRepo()
            }
    }
}


struct RepoView_Previews: PreviewProvider {
    static var previews: some View {
        RepoView()
    }
}


extension RepoView {
    
    private var loadingScreen: some View {
        ProgressView()
            .frame(width: 90, height: 90)
            .padding()
    }
    
    
    private var listOfRepos: some View {
        ScrollView {
            LazyVStack(spacing: 0) {
                ForEach(vm.repos) { repo in
                    RepoCell(repo: repo)
                }
            }
        }
    }
}

