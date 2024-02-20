//
//  HomeBuilder.swift
//  HGViaPlaySections
//
//  Created by Hugo Coutinho on 2024-02-20.
//

import UIKit

protocol HomeRouterInput: AnyObject {
    // MARK: - VARIABLES -
    var homeViewController: HomeViewController { get set }
    
    // MARK: - INPUT METHODS -
    func make() -> HomeViewController
    func navigateToDetails(with domain: ViaPlaySection)
}

class HomeRouter: HomeRouterInput {
    var homeViewController: HomeViewController = HomeViewController()
    
    // MARK: - CONSTRUCTOR -
    init() {}
    
    func make() -> HomeViewController {
        let presenter = ViaPlayPresenter()
        
        presenter.router = self
        homeViewController.presenter = presenter
        
        return homeViewController
    }
    
    func navigateToDetails(with domain: ViaPlaySection) {
        homeViewController.navigationController?.pushViewController(DetailRouter().make(domain: domain), animated: true)
    }
}
