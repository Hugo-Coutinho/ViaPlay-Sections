//
//  ViaPlaySectionPresenter.swift
//  HGViaPlaySections
//
//  Created by Hugo Coutinho on 2024-02-20.
//

import Foundation

// MARK: - PRESENTER INPUT PROTOCOL -
protocol ViaPlaySectionPresenterInput: AnyObject {

    // MARK: - VARIABLES -
    var output: ViaPlaySectionPresenterOutput? { get set }
    var input: ViaPlayInteractorInput { get set }

    // MARK: - INPUT METHODS -
    func getSections()
}

// MARK: - PRESENTER OUTPUT PROTOCOL -
protocol ViaPlaySectionPresenterOutput: AnyObject {

    // MARK: - OUTPUT METHODS -
    func handleSuccess(domain: ViaPlayDomain)
    func removeSection()
}

class ViaPlaySectionPresenter: ViaPlaySectionPresenterInput {

    // MARK: - VARIABLES -
    weak var output: ViaPlaySectionPresenterOutput?
    var input: ViaPlayInteractorInput

    // MARK: - CONSTRUCTORS -
    init(input: ViaPlayInteractorInput) {
        self.input = input
    }

    // MARK: - INPUT -
    func getSections() {
        self.input.getSections()
    }
}

// MARK: - INTERACTOR OUTPUT -
extension ViaPlaySectionPresenter: ViaPlayInteractorOutput {
    
    func handleSuccess(sections: ViaplaySectionsEntity) {
        self.output?.handleSuccess(domain: ViaPlayDomain(sections: sections))
    }
    
    func removeSection() {
        self.output?.removeSection()
    }
}

