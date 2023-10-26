//
//  SafariView.swift
//  AppleFrameworks
//
//  Created by Artem Marhaza on 26/10/2023.
//

import SwiftUI
import SafariServices

struct SafariView: UIViewControllerRepresentable {
    
    typealias UIViewControllerType = SFSafariViewController

    let url: URL
    
    func makeUIViewController(context: Context) -> SFSafariViewController {
        SFSafariViewController(url: url)
    }
    
    func updateUIViewController(_ uiViewController: SFSafariViewController, context: Context) {
    }
}
