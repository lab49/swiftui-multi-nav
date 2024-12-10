//
//  ScreenAView.swift
//  MultiNav
//
//  Created by Joseph McSorley on 4/22/24.
//

import SwiftUI

struct ScreenAView: View {
    @Environment(NavigationCoordinator<Tab1Screens>.self) var navCoordinator
    @Bindable var vm: ScreenAViewModel
    
    var body: some View {
        VStack(spacing: 0) {
            Button(action: { navCoordinator.push(.screenB("Tab 1")) }) {
                Text("Screen B (push)").padding(.top, 20)
            }
            Button(action: { vm.presentModal(.screenX) } ) {
                Text("Screen X (modal partial-screen)").padding(.top, 20)
            }
            Button(action: { vm.presentModal(.screenX, isFullScreen: true) }) {
                Text("Screen X (modal full-screen)").padding(.top, 20)
            }
            Button(action: { vm.presentAlert(alertXComponents) }) {
                Text("Alert").padding(.top, 20)
            }
        }
        .navigationTitle("Main Menu")
        .modalPresenting(using: vm, navCoordinator: navCoordinator)
    }
    
    private var alertXComponents: AlertViewComponents {
        AlertViewComponents(title: "Alert",
                            message: "Alert details.",
                            buttons: [AlertButton(id: 555, title: "Done", role: .cancel)])
    }
}

#Preview {
    let navCoordinator = NavigationCoordinator<Tab1Screens>()
    return ScreenAView(vm: ScreenAViewModel(navCoordinator: navCoordinator))
        .environment(navCoordinator)
}
