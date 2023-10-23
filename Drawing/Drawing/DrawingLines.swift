//
//  DrawingLines.swift
//  Drawing
//
//  Created by Artem Marhaza on 20/10/2023.
//

import SwiftUI

struct DrawingLines: View {
    var body: some View {
        ZStack {
            GeometryReader { geometry in
                Path { path in
                    let width = geometry.size.width
                    let height = geometry.size.height
                    path.move(to: CGPoint(x: 0, y: 0))
                    path.addLine(to: CGPoint(x: width, y: 0))
                    path.addLine(to: CGPoint(x: width, y: height))
                    path.addLine(to: CGPoint(x: 0, y: height))
                }.fill(LinearGradient(gradient: .init(colors: [.blue, .purple]), startPoint: .topLeading, endPoint: .bottomTrailing))
                
                Circle()
                Circle().fill(Color.yellow).padding()
            }
        }
    }
}

struct DrawingLines_Previews: PreviewProvider {
    static var previews: some View {
        DrawingLines()
    }
}
