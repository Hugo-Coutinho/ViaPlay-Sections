//
//  ViaPlaySectionBuilder.swift
//  HGViaPlaySections
//
//  Created by Hugo Coutinho on 2024-02-20.
//

import Foundation
import HGNetworkLayer

protocol ViaPlaySectionRouterInput {
    func make(output: ViaPlayTableViewSectionOutput) -> ViaPlayTableViewSection
}

class ViaPlaySectionRouter: ViaPlaySectionRouterInput {

    // MARK: - CONSTRUCTOR -
    init() {}

    func make(output: ViaPlayTableViewSectionOutput) -> ViaPlayTableViewSection {
        let section = ViaPlayTableViewSection()
        let presenter = makePresenter(section: section)
        section.presenter = presenter
        section.delegate = output
        section.output = output
        section.startSection()
        return section
    }
}

// MARK: - ASSISTANT METHODS -
extension ViaPlaySectionRouter {
    
    // MARK: - PRESENTER BUILDER -
    private func makePresenter(section: ViaPlayTableViewSection) -> ViaPlaySectionPresenter {
        let service = ViaPlayService(baseRequest: BaseRequest())
        let interactor = ViaPlayInteractor(service: service)
        let presenter = ViaPlaySectionPresenter(input: interactor)
        interactor.output = presenter
        presenter.output = section
        return presenter
    }
}

