//
//  Tab2PurchaseOptions.swift
//  MultiNav
//
//  Created by Joseph McSorley on 4/23/24.
//

import SwiftUI

struct PurchaseOptionsView: View {
    @Environment(NavigationCoordinator<Tab2Screens>.self) var navCoordinator

    var body: some View {
        VStack {
            Button(action: { handlePurchaseOption(.fruit) }) {
                Text("Purchase Fruit")
            }
            Button(action: { handlePurchaseOption(.vegetables) }) {
                Text("Purchase Vegetables")
            }
            .padding(.top, 16)
            Button(action: handleScreenB) {
                Text("Go to ScreenB")
            }
            .padding(.top, 16)
        }
        .navigationTitle("Purchase Options")
    }
    
    private func handlePurchaseOption(_ purchaseOption: PurchaseOption) {
        navCoordinator.push(.purchaseOptionDetail(purchaseOption))
    }
    
    private func handleScreenB() {
        navCoordinator.push(.screenB("on tab 2"))
    }
}

#Preview {
    let navCoordinator = NavigationCoordinator<Tab2Screens>()
    return PurchaseOptionsView()
        .environment(navCoordinator)
}
