//
//  PurchaseOptionDetailView.swift
//  MultiNav
//
//  Created by Joseph McSorley on 4/23/24.
//

import SwiftUI

struct PurchaseOptionDetailView: View {
    @Environment(NavigationCoordinator<Tab2Screens>.self) var navCoordinator
    @Bindable var vm: PurchaseOptionDetailViewModel

    var body: some View {
        VStack {
            Text("You have chosen \(vm.purchaseOption.rawValue).  They are delicious.")
            Button(action: handlePurchase) {
                Text("Make Purchase")
            }
            .padding(.top, 16)
        }
        .navigationTitle("Purchase Option Detail")
    }
    
    private func handlePurchase() {
        navCoordinator.push(.purchaseConfirmation(vm.purchaseOption))
    }
}

#Preview {
    let navCoordinator = NavigationCoordinator<Tab2Screens>()
    let vm = PurchaseOptionDetailViewModel(purchaseOption: .fruit, navCoordinator: navCoordinator)
    return PurchaseOptionDetailView(vm: vm)
        .environment(navCoordinator)
}
