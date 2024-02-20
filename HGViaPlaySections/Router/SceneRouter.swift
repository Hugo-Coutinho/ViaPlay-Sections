//
//  SceneBuilder.swift
//  HGViaPlaySections
//
//  Created by Hugo Coutinho on 2024-02-20.
//

import UIKit
import HGUIComponent

protocol SceneRouterInput {
    func make() -> HomeViewController
}

class SceneRouter: SceneRouterInput {
    // MARK: - CONSTRUCTOR -
    init() {}
    
    func make() -> HomeViewController {
        let homeViewController = HomeRouter().make()
        homeViewController.homeSections = [
            ViaPlaySectionRouter().make(output: homeViewController)
        ]
        
        return homeViewController
    }
}
