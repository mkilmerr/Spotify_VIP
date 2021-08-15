//
//  CommonAnimations.swift
//  SpotifyVIP
//
//  Created by Marcos Kilmer Pereira de Aquino on 15/08/21.
//

import UIKit
import Lottie

protocol CommonAnimationsProtocol {
    func presentLoadingSearch()
}

class CommonAnimations: UIViewController {
    static let shared = CommonAnimations()
    private var animationView: AnimationView = .init(name: "loading_search")
    
    func presentLoadingSearch(_ viewController: UIViewController) {
        animationView = .init(name: "dot_loading")
        animationView.contentMode = .scaleAspectFit
        viewController.view.addSubview(animationView)
        animationView.center = viewController.view.center
        animationView.loopMode = .loop
        animationView.play()

    }
    
    func stopAnimation(_ viewController: UIViewController) {
        self.animationView.stop()
        self.animationView.removeFromSuperview()
       
    }
    
}
