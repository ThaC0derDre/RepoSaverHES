//
//  RepoCell.swift
//  RepoSaverHES
//
//  Created by Andres Gutierrez on 11/16/22.
//

import SwiftUI

struct RepoCell: View {
    
    @StateObject private var vm: RepoCellVM
    
    let repo: Repo
    var body: some View {
        VStack{
            HStack {
                AvatarImages(owner: repo.owner)
                repoInfo
                Spacer()
                favorite
            }
            .padding(10)
            
            customBorder
        }
    }
    init(repo: Repo) {
        _vm = StateObject(wrappedValue: RepoCellVM(repo: repo))
        self.repo = repo
    }
}

struct RepoCell_Previews: PreviewProvider {
    static var previews: some View {
        RepoView()
    }
}

extension RepoCell {

    
    private var repoInfo: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(repo.fullName ?? "No Name")
                .fontWeight(.heavy)
                .minimumScaleFactor(0.8)
                .lineLimit(1)
            
            Text(repo.description ?? "No Description")
                .foregroundColor(.secondary)
                .lineLimit(4)
            
            HStack {
                Text("Language:")
                    .foregroundColor(.secondary)
                
                Text("\(vm.language ?? "No Language")")
                    .foregroundColor(.white)
                    .padding(3)
                    .background(Color("AppRed"))
                    .cornerRadius(5)
            }
            .padding(.vertical, 5)
        }
        
    }
    
    private var favorite: some View {
        Image(systemName: "heart")
            .resizable()
            .frame(width: 22, height: 20)
            .foregroundColor(.black)
            .padding(.horizontal, 15)
    }
    
    private var customBorder: some View {
        Rectangle()
            .frame(height: 1)
            .ignoresSafeArea()
            .frame(maxWidth: .infinity)
            .foregroundColor(.secondary.opacity(0.3))
    }
}
