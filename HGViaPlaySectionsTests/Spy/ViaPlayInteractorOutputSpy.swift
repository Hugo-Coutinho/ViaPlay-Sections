//
//  ViaPlayInteractorSpy.swift
//  HGViaPlaySectionsTests
//
//  Created by Hugo Coutinho on 2024-02-20.
//

import Foundation
@testable import HGViaPlaySections

class ViaPlayInteractorOutputSpy: ViaPlayInteractorOutput {
    func handleSuccess(sections: ViaplaySectionsEntity) {}
    func removeSection() {}
}
