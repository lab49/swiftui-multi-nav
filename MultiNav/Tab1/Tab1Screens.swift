//
//  Tab1Screens.swift
//  Veritask
//
//  Created by Joseph McSorley on 2/19/24.
//

import SwiftUI

indirect enum Tab1Screens: NavigationScreenDefinition {
    case screenA
    case screenB(String)
    case screenC(Int)
    case screenX
    
    static let root = Tab1Screens.screenA
    
    @ViewBuilder
    func screenView(navCoordinator: NavigationCoordinator<Self>) -> some View {
        switch self {
        case .screenA: screenAView(navCoordinator: navCoordinator)
        case .screenB(let name): screenBView(name: name, navCoordinator: navCoordinator)
        case .screenC(let num): screenCView(num: num, navCoordinator: navCoordinator)
        case .screenX: screenXView(navCoordinator: navCoordinator)
        }
    }
    
    private func screenAView(navCoordinator: NavigationCoordinator<Self>) -> some View {
        let vm = navCoordinator.observable(for: self, default: ScreenAViewModel(navCoordinator: navCoordinator))
        return ScreenAView(vm: vm)
    }
    
    private func screenBView(name: String, navCoordinator: NavigationCoordinator<Self>) -> some View {
        let vm = navCoordinator.observable(for: self, default: ScreenBViewModel(name: name))
        return ScreenBView<Tab1Screens>(vm: vm)
    }
    
    private func screenCView(num: Int, navCoordinator: NavigationCoordinator<Self>) -> some View {
        let vm = navCoordinator.observable(for: self, default: ScreenCViewModel<Tab1Screens>(num: num, navCoordinator: navCoordinator))
        return ScreenCView<Tab1Screens>(vm: vm)
    }
    
    private func screenXView(navCoordinator: NavigationCoordinator<Self>) -> some View {
        let vm = navCoordinator.observable(for: self, default: ScreenXViewModel(navCoordinator: navCoordinator))
        return ScreenXView(vm: vm)
    }
}
