//
//  FavoritesView.swift
//  RepoSaverHES
//
//  Created by Andres Gutierrez on 11/19/22.
//

import RealmSwift
import SwiftUI

struct FavoritesView: View {
    @ObservedResults(Favorite.self) var favorite
    @Environment(\.presentationMode) var presentation
    @StateObject private var vm = FavoriteVM()
    @State var showFavorites    = true
    @State var textString       = ""
    
    var body: some View {
        GeometryReader { proxy in
            VStack(spacing: 0) {
                RepoHeader(showFavorites: $showFavorites, proxy: proxy)
                
                if favorite.isEmpty {
                    emptyStateView(proxy)
                } else {
                    List {
                        ForEach(favorite) { repo in
                            HStack {
                                AvatarImage(avatarImage: vm.getImageFromStorage(avatarPath: repo.avatar))
                                
                                RepoBody(name: repo.name,
                                         desc: repo.descrp,
                                         lang: repo.language)
                            }
                        }
                        .onDelete(perform: $favorite.remove)
                        .listRowSeparator(.hidden)
                        
                    }
                    .listStyle(.plain)
                }
            }
            .ignoresSafeArea()
            .onChange(of: showFavorites) { newValue in
                presentation.wrappedValue.dismiss()
            }
        }
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
    }
}

extension FavoritesView {
    private func emptyStateView(_ proxy: GeometryProxy) -> some View {
        VStack(spacing: 0) {
            Text("NO FAVORITES ADDED..")
                .font(.title)
                .fontWeight(.bold)
                .padding(.vertical, 10)
            HStack {
                Text("Press")
                    .font(.title3)
                Image(systemName: "heart")
                Text("to save to your favorites!")
                    .font(.title3)
            }
            EmptyStateView(animationName: Animations.favorites.rawValue)
                .offset(y: -80)
        }
        .padding(.top, proxy.size.height / 10)
    }
}
