//
//  AvatarImage.swift
//  RepoSaverHES
//
//  Created by Andres Gutierrez on 11/18/22.
//

import SwiftUI
struct AvatarImage: View {
    
    let avatarImage: UIImage?
    
    
    var body: some View {
        VStack {
            if let avatarImage {
                Image(uiImage: avatarImage)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50, alignment: .top)
                    .cornerRadius(50)
                    .padding(5)
            } else {
                placeHolderImage
            }
            Spacer()
        }
    }
}

extension AvatarImage {
    private var placeHolderImage: some View {
        Image(systemName: "person.circle")
            .resizable()
            .scaledToFit()
            .frame(width: 42, height: 42, alignment: .top)
            .cornerRadius(50)
            .padding(5)
    }
}
