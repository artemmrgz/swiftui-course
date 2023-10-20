//
//  MovieDetail.swift
//  MovieTracker
//
//  Created by Artem Marhaza on 19/10/2023.
//

import SwiftUI

struct MovieDetail: View {
    
    @State var movie: Movie
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var movieStorage: MovieStorage
    let newMovie: Bool
    
    var body: some View {
        List {
            Section {
                SectionTitle(title: "Title")
                TextField("Movie Title", text: $movie.title)
            }
            Section {
                SectionTitle(title: "Rating")
                HStack {
                    Spacer()
                    Text(String(repeating: "⭐️", count: Int(movie.rating))).font(.title)
                    Spacer()
                }
                Slider(value: $movie.rating, in: 1...5, step: 1)
            }
            Section {
                SectionTitle(title: "Seen")
                Toggle(isOn: $movie.seen) {
                    if movie.title == "" {
                        Text("I have seen this movie")
                    } else {
                        Text("I have seen \(movie.title)")
                    }
                }
            }
            Section {
                Button(action: {
                    if newMovie {
                        movieStorage.movies.append(movie)
                    } else {
                        for i in 0..<movieStorage.movies.count {
                            if movieStorage.movies[i].id == movie.id {
                                movieStorage.movies[i] = movie
                            }
                        }
                    }
                    presentationMode.wrappedValue.dismiss()
                }) {
                    HStack {
                        Spacer()
                        Text("Save").padding(12).background(Color.blue).cornerRadius(10).foregroundColor(.white)
                        Spacer()
                    }
                }.disabled(movie.title.isEmpty)
            }
        }.listStyle(GroupedListStyle())
    }
}

struct ContView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetail(movie: Movie(), newMovie: true)
    }
}

struct SectionTitle: View {
    
    var title: String
    
    var body: some View {
        Text(title).font(.caption).foregroundColor(.purple)
    }
}
