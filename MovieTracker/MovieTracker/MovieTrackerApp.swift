//
//  MovieTrackerApp.swift
//  MovieTracker
//
//  Created by Artem Marhaza on 16/10/2023.
//

import SwiftUI

@main
struct MovieTrackerApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
