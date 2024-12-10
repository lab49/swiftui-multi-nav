//
//  ScreenCView.swift
//  MultiNav
//
//  Created by Joseph McSorley on 4/22/24.
//

import SwiftUI

struct ScreenCView<S: NavigationScreenDefinition>: View {
    @Environment(NavigationCoordinator<S>.self) var navCoordinator
    @Bindable var vm: ScreenCViewModel<S>
    
    var body: some View {
        VStack {
            Text("Final hello (\(vm.num))")
            Button(action: handlePresentSheet) {
                Text("Present Sheet")
            }
            .padding(.top, 16)
            Button(action: { navCoordinator.popToRoot() }) {
                Text("Pop to Root")
            }
            .padding(.top, 16)
        }
        .navigationTitle("ScreenC")
        .modalPresenting(using: vm, navCoordinator: navCoordinator)
    }
    
    private func handlePresentSheet() {
        guard let screen = Tab1Screens.screenX as? S ?? Tab2Screens.screenX as? S else { return }
        vm.presentModal(screen)
    }
}

#Preview {
    let navCoordinator = NavigationCoordinator<Tab1Screens>()
    return ScreenCView<Tab1Screens>(vm: ScreenCViewModel(num: 99, navCoordinator: navCoordinator))
        .environment(navCoordinator)
}
