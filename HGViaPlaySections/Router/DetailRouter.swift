//
//  DetailBuilder.swift
//  HGViaPlaySections
//
//  Created by Hugo Coutinho on 2024-02-20.
//

import UIKit

protocol DetailRouterInput {
    // MARK: - INPUT METHODS -
    func make(domain: ViaPlaySection) -> SectionDetailViewController
}

class DetailRouter: DetailRouterInput {
    // MARK: - CONSTRUCTOR -
    init() {}
    
    func make(domain: ViaPlaySection) -> SectionDetailViewController {
        let detail = SectionDetailViewController()
        detail.domain = domain
        return detail
    }
}



