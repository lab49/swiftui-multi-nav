//
//  ScreenXViewModel.swift
//  MultiNav
//
//  Created by Joseph McSorley on 6/7/24.
//

import Foundation

@Observable
class ScreenXViewModel<S: NavigationScreenDefinition> {
    let navCoordinator: NavigationCoordinator<S>
    private var ver = 0
    
    init(navCoordinator: NavigationCoordinator<S>) {
        self.navCoordinator = navCoordinator
        
        self.ver = nextVer
        nextVer += 1
        print("ScreenXViewModel.init()  Called for instance \(self.ver)")
    }
    
    deinit {
        print("ScreenXViewModel.deinit()  Called for instance \(ver)")
    }
}

private var nextVer = 1
