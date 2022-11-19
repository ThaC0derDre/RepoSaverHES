//
//  FavoritesView.swift
//  RepoSaverHES
//
//  Created by Andres Gutierrez on 11/19/22.
//

import SwiftUI

struct FavoritesView: View {
    
    @State var showFavorites = true
    @State var textString = ""
    @State var isSearching = false
    
    var body: some View {
        GeometryReader { proxy in
            VStack(spacing: 0) {
                RepoHeader(proxy: proxy, showFavorites: $showFavorites)
                RepoSearchBar(textString: $textString, searching: $isSearching, proxy: proxy)
                //            Spacer()
            }
            .ignoresSafeArea()
            
        }
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
    }
}
