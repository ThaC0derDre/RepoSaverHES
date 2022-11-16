//
//  RepoView.swift
//  RepoSaverHES
//
//  Created by Andres Gutierrez on 11/16/22.
//

import SwiftUI

struct RepoView: View {
    
    @StateObject private var vm = RepoVM()
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(vm.repos) { repo in
                    Text(repo.fullName ?? "Unknown Name")
                }
            }
        }
        .padding()
    }
}

struct RepoView_Previews: PreviewProvider {
    static var previews: some View {
        RepoView()
    }
}
