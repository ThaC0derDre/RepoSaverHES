//
//  CustomBorder.swift
//  RepoSaverHES
//
//  Created by Andres Gutierrez on 11/19/22.
//

import SwiftUI

struct CustomBorder: View {
    var body: some View {
        Rectangle()
            .frame(height: 1)
            .ignoresSafeArea()
            .frame(maxWidth: .infinity)
            .foregroundColor(.secondary.opacity(0.3))
    }
}
