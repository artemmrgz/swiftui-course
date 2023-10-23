//
//  ContentView.swift
//  Drawing
//
//  Created by Artem Marhaza on 20/10/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State var show = false

    var body: some View {
        VStack {
            Circle()
            if show {
                DrawingLines().transition(.scale)
            }
            Circle()
            Button(action: {
                withAnimation {
                    show.toggle()
                }
            }) {
                Text("Animate")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
