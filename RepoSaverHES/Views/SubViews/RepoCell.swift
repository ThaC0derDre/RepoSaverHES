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
            HStack {
                VStack {
                    if let avatarImg = vm.avatarImage {
                        Image(uiImage: avatarImg)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50, alignment: .top)
                            .cornerRadius(50)
                            .padding(5)
                    }
                    Spacer()
                }
                
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
                        
                        Text("\(vm.language ?? "luctus")")
                            .foregroundColor(.white)
                            .padding(3)
                            .background(Color("AppRed"))
                            .cornerRadius(5)
                    }
                    .padding(.vertical, 5)
                }
                
                Image(systemName: "heart")
                    .resizable()
                    .frame(width: 22, height: 20)
                    .foregroundColor(.black)
                    .padding(.horizontal, 15)
            }
            .padding(10)
        
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
