//
//  Helper.swift
//  RepoSaverHES
//
//  Created by Andres Gutierrez on 11/17/22.
//

import SwiftUI

class HostingController: UIHostingController<RepoListView> {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
