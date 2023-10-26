//
//  XDismissButton.swift
//  AppleFrameworks
//
//  Created by Artem Marhaza on 26/10/2023.
//

import SwiftUI

struct XDismissButton: View {
    
    @Binding var isShowingView: Bool

    var body: some View {
        HStack {
            Spacer()
            Button {
                isShowingView = false
            } label: {
                Image(systemName: "xmark")
                    .foregroundColor(Color(.label))
                    .imageScale(.large)
                    .frame(width: 44, height: 44)
            }
        }.padding()
    }
}

struct XDismissButton_Previews: PreviewProvider {
    static var previews: some View {
        XDismissButton(isShowingView: .constant(false))
    }
}
