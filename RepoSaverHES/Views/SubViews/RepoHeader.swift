//
//  RepoHeader.swift
//  RepoSaverHES
//
//  Created by Andres Gutierrez on 11/16/22.
//

import SwiftUI

struct RepoHeader: View {
    @Binding var showFavorites: Bool
    let proxy: GeometryProxy
    
    var body: some View {
        ZStack{
            redBackground
            
            toolBars
        }
    }
}


extension RepoHeader {
    private var redBackground: some View {
        Rectangle()
            .frame(height: proxy.size.height / 8)
            .frame(maxWidth: .infinity)
            .foregroundColor(.appRed)
            .ignoresSafeArea()
    }
    
    
    private var toolBars: some View {
        HStack {
                Text("Repos")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(21)
                    .onTapGesture {
                        if showFavorites {
                            showFavorites.toggle()
                        }
                    }
            
            Spacer()
            
            Image(systemName: "heart.fill")
                .resizable()
                .frame(width: 22, height: 20)
                .foregroundColor(.white)
                .padding(21)
                .onTapGesture {
                    if !showFavorites {
                        showFavorites.toggle()
                    }
                }
        }
        .padding(.top, 25)
        .padding(.trailing, 5)
    }
}
