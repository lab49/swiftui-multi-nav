//
//  ContentView.swift
//  MultiNav
//
//  Created by Joseph McSorley on 4/22/24.
//

import SwiftUI

struct MainTabView: View {
    @Bindable var vm: MainTabViewModel
    
    var body: some View {
        TabView(selection: $vm.selectedTab) {
            tabView(.one, navCoordinator: vm.tab1Coordinator)
            tabView(.two, navCoordinator: vm.tab2Coordinator)
        }
    }
    
    private func tabView<S: NavigationScreenDefinition>(_ mainTab: MainTab, navCoordinator: NavigationCoordinator<S>) -> some View {
        NavigationRootView(navCoordinator: navCoordinator)
            .tag(mainTab)
            .tabItem {
                Label(mainTab.title, systemImage: mainTab.imageName)
            }
    }
}

#Preview {
    MainTabView(vm: MainTabViewModel())
}
