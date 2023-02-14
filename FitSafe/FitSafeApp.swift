//
//  FitSafeApp.swift
//  FitSafe
//
//  Created by William Souef on 07/02/2023.
//

import SwiftUI

@main
struct FitSafeApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, ItemsProvider.shared.viewContext)
        }
    }
}
