//
//  MultiNavApp.swift
//  MultiNav
//
//  Created by Joseph McSorley on 4/22/24.
//

import SwiftUI

@main
struct MultiNavApp: App {
    var body: some Scene {
        WindowGroup {
            MainTabView(vm: mainTabViewModel)
        }
    }
}
