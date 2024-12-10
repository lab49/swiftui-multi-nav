//
//  MainTabViewModel.swift
//  MultiNav
//
//  Created by Joseph McSorley on 4/22/24.
//

import Foundation

@Observable
class MainTabViewModel {
    var selectedTab: MainTab = .one
    @ObservationIgnored private(set) var tab1Coordinator = NavigationCoordinator<Tab1Screens>()
    @ObservationIgnored private(set) var tab2Coordinator = NavigationCoordinator<Tab2Screens>()
}

enum MainTab {
    case one
    case two
    
    var title: String {
        switch self {
        case .one: "One"
        case .two: "Two"
        }
    }
    
    var imageName: String {
        switch self {
        case .one: "person.fill"
        case .two: "person.2.fill"
        }
    }
}
