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

enum AnimationsType {
    case loadingSearch
    case loading
    case searchMusic
}

class CommonAnimations: UIViewController {
    static let shared = CommonAnimations()
    private var type: AnimationsType = .loadingSearch
    private var animationView: AnimationView = .init(name: "loading_search")
    
    func presentAnimation(_ viewController: UIViewController, type: AnimationsType) {
        setType(type: type)
        animationView.contentMode = .scaleAspectFit
        viewController.view.addSubview(animationView)
        animationView.center = viewController.view.center
        animationView.loopMode = .loop
        animationView.play()

    }
    func stopAnimation(_ viewController: UIViewController) {
        self.animationView.removeFromSuperview()
    }
    
    private func setType(type: AnimationsType) {
        switch type {
        case .loading:
            animationView = .init(name: "dot_loading")
        case .loadingSearch:
            animationView = .init(name: "loading_search")
        case .searchMusic:
            animationView = .init(name: "search_music")
        }
    }
}
