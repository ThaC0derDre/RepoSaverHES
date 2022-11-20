//
//  EmptyStateView.swift
//  RepoSaverHES
//
//  Created by Andres Gutierrez on 11/19/22.
//

import SwiftUI
import Lottie

struct EmptyStateView: UIViewRepresentable {
    
    let animationName: String
    
    func makeUIView(context: Context) -> some UIView {
        
        let view = UIView(frame: .zero)
        
        let lottieAnimationView = LottieAnimationView(name: animationName, bundle: Bundle.main)
        
        lottieAnimationView.contentMode = .scaleAspectFit
        lottieAnimationView.loopMode    = .loop
        lottieAnimationView.play()
        
        lottieAnimationView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(lottieAnimationView)
        
        NSLayoutConstraint.activate([
            lottieAnimationView.widthAnchor.constraint(equalTo: view.widthAnchor),
            lottieAnimationView.heightAnchor.constraint(equalTo: view.heightAnchor)
        ])
        
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) { }
}
