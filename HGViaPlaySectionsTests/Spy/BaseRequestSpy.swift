//
//  BaseRequestSpy.swift
//  HGViaPlaySectionsTests
//
//  Created by Hugo Coutinho on 2024-02-20.
//

import Foundation
import HGNetworkLayer

 class BaseRequestSuccessHandlerSpy: BaseRequestInput {

    // MARK: - ENUM -
     enum ServiceEnum {
        case viaPlay
    }

    // MARK: - DECLARATIONS -
     var service: ServiceEnum

     init(service: ServiceEnum) {
        self.service = service
    }

    // MARK: -  FUNCTIONS -
     func doRequest(urlString: String, completionHandler: @escaping (Data?) -> Void) {
        if let data = readLocalFile(forName: getLocalFileNameByService()) {
            completionHandler(data)
        } else {
            fatalError("should return json data")
        }
    }
}

// MARK: - ASSISTANT -
extension BaseRequestSuccessHandlerSpy {
    private func getLocalFileNameByService() -> String {
        switch self.service {
        case .viaPlay: "ViaPlay_data"
        }
    }

    private func readLocalFile(forName name: String) -> Data? {
        do {
            print("bundle")
            if let bundlePath = Bundle.main.path(forResource: name,
                                                 ofType: "json"),
               let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                return jsonData
            }
        } catch {
            print(error)
        }

        return nil
    }
}

 class BaseRequestErrorHandlerSpy: BaseRequestInput {
     func doRequest(urlString: String, completionHandler: @escaping (Data?) -> Void) {
        completionHandler(nil)
    }
}
