//
//  ScreenAViewModel.swift
//  MultiNav
//
//  Created by Joseph McSorley on 4/22/24.
//

import Foundation

@Observable
class ScreenAViewModel: ModalPresenter<Tab1Screens> {
    let navCoordinator: NavigationCoordinator<Tab1Screens>
    
    init(navCoordinator: NavigationCoordinator<Tab1Screens>) {
        self.navCoordinator = navCoordinator
    }
    
    override func handleAlertButton(id: Int) {
        print("ScreenAViewModel.handleAlertButton()  Called with button = \(id)")
    }
}
