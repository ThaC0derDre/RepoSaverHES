//
//  RepoListView.swift
//  RepoSaverHES
//
//  Created by Andres Gutierrez on 11/16/22.
//

import SwiftUI

struct RepoListView: View {
    @StateObject private var vm = RepoVM()
    @State var showFavorites    = false
    @State var searching        = false
    
    var body: some View {
        NavigationStack {
            GeometryReader { proxy in
                VStack(spacing: 0) {
                    RepoHeader(showFavorites: $showFavorites, proxy: proxy)
                    
                    RepoSearchBar(textString: $vm.searchFor,
                                  searching: $searching,
                                  proxy: proxy)
                    
                    if vm.isLoading {
                        loadingScreen
                    } else if vm.repos.isEmpty {
                        EmptyStateView(animationName: Animations.error.rawValue)
                    } else {
                        listOfRepos
                    }
                }
                .ignoresSafeArea()
            }
            .onChange(of: searching) { _ in
                vm.searchRepo()
            }
            .alert("Oh no..", isPresented: $vm.showAlert, actions: {}, message: {
                Text(vm.errorMessage?.rawValue ?? "An Error has occured. Please try again")
            })
            .navigationDestination(isPresented: $showFavorites) {
                FavoritesView()
                    .navigationBarBackButtonHidden()
            }
        }
    }
}


struct RepoListView_Previews: PreviewProvider {
    static var previews: some View {
        RepoListView()
    }
}


extension RepoListView {
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

