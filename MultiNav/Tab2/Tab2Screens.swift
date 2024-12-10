//
//  Tab2Screens.swift
//  MultiNav
//
//  Created by Joseph McSorley on 4/23/24.
//

import SwiftUI

indirect enum Tab2Screens: NavigationScreenDefinition {
    case purchaseOptions                       // No viewModel
    case purchaseOptionDetail(PurchaseOption)  // These two share a viewModel
    case purchaseConfirmation(PurchaseOption)
    case screenB(String)                       // These two screens are shared across tabs
    case screenC(Int)
    case screenX                               // To be presented modally
    
    static let root = Tab2Screens.purchaseOptions
    
    @ViewBuilder
    func screenView(navCoordinator: NavigationCoordinator<Self>) -> some View {
        switch self {
        case .purchaseOptions:
            PurchaseOptionsView()
        case .purchaseOptionDetail(let purchaseOption):
            purchaseOptionDetailView(purchaseOption: purchaseOption, navCoordinator: navCoordinator)
        case .purchaseConfirmation(let purchaseOption):
            purchaseConfirmationView(purchaseOption: purchaseOption, navCoordinator: navCoordinator)
        case .screenB(let name):
            screenBView(name: name, navCoordinator: navCoordinator)
        case .screenC(let num):
            screenCView(num: num, navCoordinator: navCoordinator)
        case .screenX:
            screenXView(navCoordinator: navCoordinator)
        }
    }
    
    private func purchaseOptionDetailView(purchaseOption: PurchaseOption, navCoordinator: NavigationCoordinator<Self>) -> some View {
        let vm = navCoordinator.observable(for: self, default: PurchaseOptionDetailViewModel(purchaseOption: purchaseOption, navCoordinator: navCoordinator))
        return PurchaseOptionDetailView(vm: vm)
    }
    
    private func purchaseConfirmationView(purchaseOption: PurchaseOption, navCoordinator: NavigationCoordinator<Self>) -> some View {
        let vm = navCoordinator.observable(for: .purchaseOptionDetail(purchaseOption), default: PurchaseOptionDetailViewModel(purchaseOption: purchaseOption, navCoordinator: navCoordinator))
        return PurchaseOptionConfirmationView(vm: vm)
    }
    
    private func screenBView(name: String, navCoordinator: NavigationCoordinator<Self>) -> some View {
        let vm = navCoordinator.observable(for: self, default: ScreenBViewModel(name: name))
        return ScreenBView<Tab2Screens>(vm: vm)
    }
    
    private func screenCView(num: Int, navCoordinator: NavigationCoordinator<Self>) -> some View {
        let vm = navCoordinator.observable(for: self, default: ScreenCViewModel<Tab2Screens>(num: num, navCoordinator: navCoordinator))
        return ScreenCView<Tab2Screens>(vm: vm)
    }
    
    private func screenXView(navCoordinator: NavigationCoordinator<Self>) -> some View {
        let vm = navCoordinator.observable(for: self, default: ScreenXViewModel(navCoordinator: navCoordinator))
        return ScreenXView(vm: vm)
    }
}

enum PurchaseOption: String {
    case fruit
    case vegetables
}
