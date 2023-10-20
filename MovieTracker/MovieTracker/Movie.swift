//
//  Movie.swift
//  MovieTracker
//
//  Created by Artem Marhaza on 20/10/2023.
//

import Foundation

struct Movie: Identifiable {
    var id = UUID()
    var title = ""
    var rating = 3.0
    var seen = false
}

class MovieStorage: ObservableObject {
    @Published var movies = [Movie]()
}
