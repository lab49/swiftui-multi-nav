//
//  Globals.swift
//  MultiNav
//
//  Created by Joseph McSorley on 4/23/24.
//

import SwiftUI

/// This is a (global) container for entites that need to be accessed app-wide.  It should be used sparingly.
/// Anything that would ordinarliy otherwise be a singleton should be added here as a single instance (making this the only singleton in the app).
/// All entities included here should be relatively cheap to instantiate (over and over) during testing.
/// All entities held here are lazy vars in order to avoid circular references (if their init methods refer to something else in Globals).

// MARK: - Global Entities

class Globals {
    static let shared = Globals()
    private init() {}
    
    private(set) lazy var mainTabViewModel = MainTabViewModel()
}

// MARK: - Global Accessors

var mainTabViewModel: MainTabViewModel {
    Globals.shared.mainTabViewModel
}

// MARK: - Window/Screen Helpers

var keyWindow: UIWindow? {
    UIApplication.shared.connectedScenes.compactMap({ ($0 as? UIWindowScene)?.keyWindow }).last
}

var safeArea: UIEdgeInsets {
    keyWindow?.safeAreaInsets ?? UIEdgeInsets.zero
}

var safeScreenSize: CGSize {
    CGSize(width: UIScreen.main.bounds.width-(safeArea.left + safeArea.right), height: UIScreen.main.bounds.height-(safeArea.top + safeArea.bottom))
}

var screenSize: CGSize {
    CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
}

var deviceId: String? {
    UIDevice.current.identifierForVendor?.uuidString
}
