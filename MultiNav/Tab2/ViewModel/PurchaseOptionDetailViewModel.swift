//
//  PurchaseOptionDetailViewModel.swift
//  MultiNav
//
//  Created by Joseph McSorley on 4/23/24.
//

import Foundation

@Observable
class PurchaseOptionDetailViewModel: ModalPresenter<Tab2Screens> {
    let purchaseOption: PurchaseOption
    let navCoordinator: NavigationCoordinator<Tab2Screens>
    
    init(purchaseOption: PurchaseOption, navCoordinator: NavigationCoordinator<Tab2Screens>) {
        self.purchaseOption = purchaseOption
        self.navCoordinator = navCoordinator
    }
    
    override func handleAlertButton(id: Int) {
        switch id {
        case 111: navCoordinator.popToRoot()
        default: break
        }
    }
}
