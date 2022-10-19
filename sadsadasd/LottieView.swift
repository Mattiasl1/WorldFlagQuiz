//
//  LottieView.swift
//  World - Flag quiz
//
//  Created by Mattias Liljenberg on 2022-10-13.
//

import Lottie
import SwiftUI
import UIKit

struct LottieView: UIViewRepresentable {
    func makeUIView(context: UIViewRepresentableContext<LottieView>) -> UIView {
        let view = UIView(frame: .zero)
        
        // add animation
        let animationView = LottieAnimationView()
        animationView.animation = Animation.named("loading")
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.play()
        view.addSubview(animationView)
        
        animationView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor),
            animationView.widthAnchor.constraint(equalTo: view.heightAnchor)
        ])
        
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<LottieView>) {
        // do nothing
    }
    
    
    typealias UIViewType = UIView
}
