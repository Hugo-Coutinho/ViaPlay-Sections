//
//  ViaPlayService.swift
//  HGViaPlaySections
//
//  Created by Hugo Coutinho on 2024-02-20.
//

import Foundation
import HGNetworkLayer

// MARK: - SERVICE INPUT PROTOCOL -
protocol ViaPlayServiceInput: AnyObject {
    // MARK: - VARIABLES -
    var baseRequest: BaseRequestInput { get set }
    
    // MARK: - INPUT METHODS -
    func getSections(completionHandler: @escaping (Data?) -> Void)
}

class ViaPlayService: ViaPlayServiceInput {
    
    // MARK: - VARIABLES -
    var baseRequest: BaseRequestInput
    
    // MARK: - CONSTRUCTOR -
    init(baseRequest: BaseRequestInput) {
        self.baseRequest = baseRequest
    }
    
    func getSections(completionHandler: @escaping (Data?) -> Void) {
        baseRequest.doRequest(urlString: APIConstant.baseURLString) { resultData in
            completionHandler(resultData)
        }
    }
}

struct APIConstant {
    static let baseURLString = "https://content.viaplay.com/ios-se"
}
