//
//  ViaPlayInteractor.swift
//  HGViaPlaySections
//
//  Created by Hugo Coutinho on 2024-02-20.
//

import Foundation

// MARK: - INTERACTOR INPUT PROTOCOL -
protocol ViaPlayInteractorInput: AnyObject {

    // MARK: - VARIABLES -
    var output: ViaPlayInteractorOutput? { get set }
    var service: ViaPlayServiceInput { get set }

    // MARK: - INPUT METHODS -
    func getSections()
}

// MARK: - INTERACTOR OUTPUT PROTOCOL -
protocol ViaPlayInteractorOutput: AnyObject {
    // MARK: - OUTPUT METHODS -
    func handleSuccess(sections: ViaplaySectionsEntity)
    func removeSection()
}

 class ViaPlayInteractor: ViaPlayInteractorInput {

    // MARK: - VARIABLES -
     weak var output: ViaPlayInteractorOutput?
     var service: ViaPlayServiceInput

    // MARK: - CONSTRUCTOR -
    init(service: ViaPlayServiceInput) {
        self.service = service
    }
     
    func getSections() {
        service.getSections { [weak self] dataResult in
            guard let strongSelf = self else { return }
            if let data = dataResult {
                strongSelf.decode(data: data)
            } else {
                strongSelf.output?.removeSection()
            }
        }
    }
}

// MARK: - ASSISTANT METHODS -
extension ViaPlayInteractor {
    private func decode(data: Data) {
        do {
            let result = try JSONDecoder().decode(ViaplayResult.self, from: data)
            output?.handleSuccess(sections: result.links.viaplaySections)

        } catch {
            print("error scene")
            output?.removeSection()
        }
    }
}

