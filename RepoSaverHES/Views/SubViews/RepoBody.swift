//
//  RepoBody.swift
//  RepoSaverHES
//
//  Created by Andres Gutierrez on 11/19/22.
//

import SwiftUI

struct RepoBody: View {
    
    let name: String
    let desc: String?
    let lang: String?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            repoName
            
            repoDescription
            
            language
            
        }
    }
}


extension RepoBody {
    private var repoName: some View {
        Text(name)
            .fontWeight(.heavy)
            .minimumScaleFactor(0.8)
            .lineLimit(1)
    }
    
    
    private var repoDescription: some View {
        Text(desc ?? "Can't describe it..")
            .foregroundColor(.secondary)
            .lineLimit(4)
    }
    
    
    private var language: some View {
        HStack {
            Text("Language:")
                .foregroundColor(.secondary)
            
            Text(lang ?? "N/A")
                .foregroundColor(.white)
                .padding(3)
                .background(.appRed)
                .cornerRadius(5)
        }
        .padding(.vertical, 5)
    }
}
