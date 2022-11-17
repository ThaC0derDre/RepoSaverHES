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
        GeometryReader { proxy in
            VStack(spacing: 0) {
                RepoHeader(proxy: proxy)
                ScrollView {
                    VStack(spacing: 0) {
//                        ForEach(vm.repos) { repo in
//                            RepoCell(repo: repo)
//                        }
                        Text("Desc")
                        .padding()
                    }
                }
            }
                .ignoresSafeArea()
        }
    }
}

struct RepoView_Previews: PreviewProvider {
    static var previews: some View {
        RepoView()
        //            .preferredColorScheme(.dark)
    }
}

extension RepoView {
}
