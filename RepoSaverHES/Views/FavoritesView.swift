//
//  FavoritesView.swift
//  RepoSaverHES
//
//  Created by Andres Gutierrez on 11/19/22.
//

import SwiftUI
import RealmSwift

struct FavoritesView: View {
    @ObservedResults(Favorite.self) var favorite
    @Environment(\.presentationMode) var presentation
    @StateObject private var vm = FavoriteVM()
    @State var showFavorites = true
    @State var textString = ""
    
    var body: some View {
        GeometryReader { proxy in
            VStack(spacing: 0) {
                RepoHeader(proxy: proxy, showFavorites: $showFavorites)
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

