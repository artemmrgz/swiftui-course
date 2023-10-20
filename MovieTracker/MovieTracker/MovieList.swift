//
//  MovieList.swift
//  MovieTracker
//
//  Created by Artem Marhaza on 20/10/2023.
//

import SwiftUI

struct MovieList: View {
    
    @ObservedObject var movieStorage = MovieStorage()
    
    var body: some View {
        NavigationView {
            List(movieStorage.movies) { movie in
                NavigationLink(destination: MovieDetail(movie: movie, newMovie: false)) {
                    Text(movie.title)
                }
            }.navigationTitle("Movies").toolbar {
                NavigationLink(destination: MovieDetail(movie: Movie(), newMovie: true)) {
                    Image(systemName: "plus")
                }
            }
        }
    }
}

struct MovieList_Previews: PreviewProvider {
    static var previews: some View {
        MovieList()
    }
}
