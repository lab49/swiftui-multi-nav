//
//  ScreenXView.swift
//  MultiNav
//
//  Created by Joseph McSorley on 6/7/24.
//

import SwiftUI

struct ScreenXView<S: NavigationScreenDefinition>: View {
    @Environment(NavigationCoordinator<S>.self) var navCoordinator
    @Environment(\.dismiss) var dismiss
    @Bindable var vm: ScreenXViewModel<S>

    var body: some View {
        Text("Screen X")
        Button(action: { dismiss() }) {
            Text("Dismiss")
        }
        .padding(.top, 16)
        Button(action: { navCoordinator.popToRoot() }) {
            Text("Pop to Root")
        }
        .padding(.top, 16)
    }
}

#Preview {
    let navCoordinator = NavigationCoordinator<Tab1Screens>()
    return ScreenXView(vm: ScreenXViewModel(navCoordinator: navCoordinator))
        .environment(navCoordinator)
}
