//
//  RepoCell.swift
//  RepoSaverHES
//
//  Created by Andres Gutierrez on 11/16/22.
//

import SwiftUI

struct RepoCell: View {
    
    let repo: Repo
    var body: some View {
        
        Text(repo.description ?? "No Description")
        
    }
}

struct RepoCell_Previews: PreviewProvider {
    static var previews: some View {
        RepoView()
    }
}
