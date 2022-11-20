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
            Text(name)
                .fontWeight(.heavy)
                .minimumScaleFactor(0.8)
                .lineLimit(1)
            
            Text(desc ?? "Can't describe")
                .foregroundColor(.secondary)
                .lineLimit(4)
            
            HStack {
                Text("Language:")
                    .foregroundColor(.secondary)
                
                Text(lang ?? "N/A")
                    .foregroundColor(.white)
                    .padding(3)
                    .background(Color("AppRed"))
                    .cornerRadius(5)
            }
            .padding(.vertical, 5)
        }
    }
}

//struct RepoBody_Previews: PreviewProvider {
//    static var previews: some View {
//        RepoBody()
//    }
//}
