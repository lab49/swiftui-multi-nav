//
//  ScreenCViewModel.swift
//  MultiNav
//
//  Created by Joseph McSorley on 4/22/24.
//

import Foundation

@Observable
class ScreenCViewModel<S: NavigationScreenDefinition>: ModalPresenter<S> {
    let navCoordinator: NavigationCoordinator<S>
    let num: Int
    
    init(num: Int, navCoordinator: NavigationCoordinator<S>) {
        self.num = num
        self.navCoordinator = navCoordinator
    }
}
