//
//  MovieTrackerApp.swift
//  MovieTracker
//
//  Created by Artem Marhaza on 19/10/2023.
//

import SwiftUI

@main
struct MovieTrackerApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            let movieStorage = MovieStorage()
            MovieList()
                .environment(\.managedObjectContext, persistenceController.container.viewContext).environmentObject(movieStorage)
        }
    }
}
