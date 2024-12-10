//
//  ScreenBView.swift
//  MultiNav
//
//  Created by Joseph McSorley on 4/22/24.
//

import SwiftUI

struct ScreenBView<S: NavigationScreenDefinition>: View {
    @Environment(NavigationCoordinator<S>.self) var navCoordinator
    @Bindable var vm: ScreenBViewModel
    
    var body: some View {
        VStack {
            Text("Hello again (\(vm.name))")
            Button(action: handleNextScreen) {
                Text("Go to ScreenC")
            }
            .padding(.top, 16)
            Button(action: handleToggleTab) {
                Text("Toggle Tabs")
            }
            .padding(.top, 16)
        }
        .navigationTitle("ScreenB")
    }
    
    private func handleNextScreen() {
        guard let nextScreen else { return }
        navCoordinator.push(nextScreen)
    }
    
    private func handleToggleTab() {
        mainTabViewModel.selectedTab = (mainTabViewModel.selectedTab == .one) ? .two : .one
    }
    
    private var nextScreen: S? {
        Tab1Screens.screenC(111) as? S ??
        Tab2Screens.screenC(222) as? S
    }
}

#Preview {
    let navCoordinator = NavigationCoordinator<Tab1Screens>()
    return ScreenBView<Tab1Screens>(vm: ScreenBViewModel(name: "test name"))
        .environment(navCoordinator)
}
