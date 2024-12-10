//
//  PurchaseOptionConfirmationView.swift
//  MultiNav
//
//  Created by Joseph McSorley on 4/23/24.
//

import SwiftUI

struct PurchaseOptionConfirmationView: View {
    @Environment(NavigationCoordinator<Tab2Screens>.self) var navCoordinator
    @Bindable var vm: PurchaseOptionDetailViewModel
    
    var body: some View {
        VStack {
            Text("You have purchased \(vm.purchaseOption.rawValue).  Enjoy!")
            Button(action: handleGoBack) {
                Text("Go Back to Purchase More")
            }
            .padding(.top, 16)
            Button(action: handleEat) {
                Text("Eat \(vm.purchaseOption.rawValue)")
            }
            .padding(.top, 16)
        }
        .navigationTitle("Purchase Confirmation")
        .modalPresenting(using: vm, navCoordinator: navCoordinator)
    }
    
    private func handleGoBack() {
        navCoordinator.popToRoot()
    }
    
    private func handleEat() {
        vm.presentAlert(AlertViewComponents(title: "Hey!",
                                            message: "You must wait 30 min before eating.",
                                            buttons: [AlertButton(id: 111, title: "Ok", role: .cancel)]))
    }
}

#Preview {
    let navCoordinator = NavigationCoordinator<Tab2Screens>()
    let vm = PurchaseOptionDetailViewModel(purchaseOption: .fruit, navCoordinator: navCoordinator)
    return PurchaseOptionConfirmationView(vm: vm)
        .environment(navCoordinator)
}
