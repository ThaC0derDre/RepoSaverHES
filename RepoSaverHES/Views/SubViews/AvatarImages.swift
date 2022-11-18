//
//  AvatarImages.swift
//  RepoSaverHES
//
//  Created by Andres Gutierrez on 11/18/22.
//

import SwiftUI

struct AvatarImages: View {
    
    @StateObject private var vm: AvatarImageVM
    
    let owner: Owner
    
    var body: some View {
        avatarImage
    }
    init(owner: Owner) {
        _vm = StateObject(wrappedValue: AvatarImageVM(owner: owner))
        self.owner = owner
    }
}

extension AvatarImages {
    
    private var avatarImage: some View {
        VStack {
            if vm.isLoading {
                ProgressView()
                    .frame(width: 50, height: 50)
            } else if let avatarImg = vm.avatarImage {
                Image(uiImage: avatarImg)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50, alignment: .top)
                    .cornerRadius(50)
                    .padding(5)
            }
            else {
                placeHolderImage
            }
            Spacer()
        }
    }
    
    
    private var placeHolderImage: some View {
        Image(systemName: "person.circle")
            .resizable()
            .scaledToFit()
            .frame(width: 42, height: 42, alignment: .top)
            .cornerRadius(50)
            .padding(5)
        
    }
}
