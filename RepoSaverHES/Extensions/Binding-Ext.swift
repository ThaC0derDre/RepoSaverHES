//
//  Binding- Ext.swift
//  RepoSaverHES
//
//  Created by Andres Gutierrez on 11/19/22.
//

import SwiftUI

extension Binding where Value == Bool {
    var negate: Binding<Value> {
            Binding<Value>(
                get: { !self.wrappedValue },
                set: { self.wrappedValue = !$0 }
            )
        }
}
