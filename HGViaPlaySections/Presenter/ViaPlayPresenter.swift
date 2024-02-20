//
//  ViaPlayPresenter.swift
//  HGViaPlaySections
//
//  Created by Hugo Coutinho on 2024-02-20.
//

import Foundation

// MARK: - PRESENTER INPUT PROTOCOL -
protocol ViaPlayPresenterInput: AnyObject {

    // MARK: - VARIABLES -
    var router: HomeRouterInput? { get set }

    // MARK: - INPUT METHODS -
    func goToDetails(domain: ViaPlaySection)
}

class ViaPlayPresenter: ViaPlayPresenterInput {
    
    // MARK: - VARIABLES -
    var router: HomeRouterInput?

    // MARK: - CONSTRUCTORS -
    init() {}
    
    func goToDetails(domain: ViaPlaySection) {
        router?.navigateToDetails(with: domain)
    }
}



