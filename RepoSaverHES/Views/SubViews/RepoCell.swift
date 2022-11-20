//
//  RepoCell.swift
//  RepoSaverHES
//
//  Created by Andres Gutierrez on 11/16/22.
//

import RealmSwift
import SwiftUI

struct RepoCell: View {
    @StateObject private var vm: RepoCellVM
    @ObservedResults(Favorite.self) var favorite
    
    let repo: Repo
    
    var body: some View {
        VStack{
            HStack {
                AvatarImage(avatarImage: vm.avatarImage)
                
                RepoBody(name: repo.fullName,
                         desc: repo.description,
                         lang: vm.language)
                
                Spacer()
                heart
            }
            .padding([.horizontal, .top], 10)
            
            CustomBorder()
                .padding([.top, .bottom], 10)
        }
    }
    init(repo: Repo) {
        _vm = StateObject(wrappedValue: RepoCellVM(repo: repo))
        self.repo = repo
    }
}


extension RepoCell {
    private var heart: some View {
        Button {
            if isLoved() {
                $favorite.remove(unlovedFavorite())
                vm.deleteImage()
            }else {
                vm.saveImage()
                addToFavorites()
            }
        }label: {
            Image(systemName: isLoved() ? "heart.fill" : "heart")
                .resizable()
                .frame(width: 22, height: 20)
                .foregroundColor(isLoved() ? .appRed : .black)
                .padding(.horizontal, 15)
        }
        
    }
    
    func addToFavorites() {
        let newFav = Favorite(avatar: repo.owner.avatarUrl.pathOnly,
                              name: repo.fullName,
                              descrp: repo.description ?? "",
                              language: vm.language ?? "None")
        $favorite.append(newFav)
    }
    
    
    func isLoved() -> Bool {
        favorite.contains { $0.name == repo.fullName  }
    }
    
    
    func unlovedFavorite() -> Results<Favorite>.Element {
        favorite.filter { $0.name == repo.fullName }.first!
    }
    
}
