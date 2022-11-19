//
//  RepoSearchBar.swift
//  RepoSaverHES
//
//  Created by Andres Gutierrez on 11/17/22.
//

import SwiftUI

struct RepoSearchBar: View {
    
    @Binding var textString: String
    @Binding var searching: Bool
    let proxy: GeometryProxy
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(Color(.tertiaryLabel))
                .padding(.horizontal, 5)
            
            TextField("Search by repo or description...", text: $textString)
                .autocorrectionDisabled()
                .onSubmit {
                    searching.toggle()
                }
        }
        .frame(height: proxy.size.height / 30)
        .padding()
        .background(Color(.tertiarySystemGroupedBackground))
    }
}

struct RepoSearchBar_Previews: PreviewProvider {
    static var previews: some View {
        RepoListView()
    }
}
