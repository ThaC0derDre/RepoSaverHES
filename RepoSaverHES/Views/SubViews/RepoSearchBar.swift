//
//  RepoSearchBar.swift
//  RepoSaverHES
//
//  Created by Andres Gutierrez on 11/17/22.
//

import SwiftUI

struct RepoSearchBar: View {
    
    @State var textString = ""
    let proxy: GeometryProxy
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(Color(.tertiaryLabel))
                .padding(.horizontal, 5)
            
            TextField("Search by name...", text: $textString)
        }
        .frame(height: proxy.size.height / 30)
        .padding()
        .background(Color(.tertiarySystemGroupedBackground))
    }
}

struct RepoSearchBar_Previews: PreviewProvider {
    static var previews: some View {
        RepoView()
    }
}
