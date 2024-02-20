//
//  ViaPlayInteractorTests.swift
//  HGViaPlaySectionsTests
//
//  Created by Hugo Coutinho on 2024-02-20.
//

import XCTest
@testable import HGViaPlaySections

class ViaPlayInteractorTests: XCTestCase {

    // MARK: - DECLARATIONS -
    private var viaPlayEntity: ViaplaySectionEntity?
    private var result: ViaplaySectionEntity?
    private var isError: Bool = false
    private var expectedName: String = "series"

    // MARK: - OVERRIDE TESTS FUNCTIONS -
    override func setUp() {
        super.setUp()
        self.viaPlayEntity = ViaplaySectionEntity(title: "", href: "", name: expectedName, sectionSort: 0)
    }

    override func tearDown() {
        super.tearDown()
        self.viaPlayEntity = nil
        self.result = nil
        self.isError = false
    }

    func test_outputNotRetained() {
        // 1. GIVEN
        var outputSpy: ViaPlayInteractorOutput? = ViaPlayInteractorOutputSpy()
        let sut = makeSUT()

        // 2. WHEN
        sut.output = outputSpy
        outputSpy = nil

        // 3. THEN
        XCTAssertNil(sut.output, "output should have been deallocated. Potential memory leak!")
    }

    func test_interactorNotRetained() {
        // 1. GIVEN
        var sut: ViaPlayInteractor? = makeSUT()

        // 2. WHEN
        sut?.getSections()
        weak var sutWeak = sut
        sut = nil

        // 3. THEN
        XCTAssertNil(sutWeak)
    }

    func test_shouldHandleSuccess_sections() {
        // 1. GIVEN
        let sut = makeSUT()
        sut.output = self

        // 2. WHEN
        sut.getSections()

        // 3. THEN
        XCTAssertNotNil(self.viaPlayEntity)
        XCTAssertNotNil(self.result)
        assert(self.viaPlayEntity?.name == self.result?.name)
    }

    func test_shouldHandleError_sections() {
        // 1. GIVEN
        let sut = makeSUTErrorHandler()
        sut.output = self

        // 2. WHEN
        sut.getSections()

        // 3. THEN
        XCTAssertTrue(self.isError)
    }
}

// MARK: - OUTPUT -
extension ViaPlayInteractorTests: ViaPlayInteractorOutput {
    func handleSuccess(sections: ViaplaySectionsEntity) {
        result = sections.first
    }

    func removeSection() {
        result = nil
        isError = true
    }
}

// MARK: - MAKE SUT -
extension ViaPlayInteractorTests {
    private func makeSUT() -> ViaPlayInteractor {
        let baseRequestSpy = BaseRequestSuccessHandlerSpy(service: .viaPlay)
        let service = ViaPlayService(baseRequest: baseRequestSpy)
        return ViaPlayInteractor(service: service)
    }

    private func makeSUTErrorHandler() -> ViaPlayInteractor {
        let baseRequestSpy = BaseRequestErrorHandlerSpy()
        let service = ViaPlayService(baseRequest: baseRequestSpy)
        return ViaPlayInteractor(service: service)
    }
}

