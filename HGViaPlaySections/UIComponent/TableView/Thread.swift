//
//  Thread.swift
//  HGViaPlaySections
//
//  Created by Hugo Coutinho on 2024-02-20.
//

import Foundation

 func executeOnMainQueue(force: Bool = false, _ completion: @escaping () -> Void ) {
    if Thread.isMainThread && !force {
        completion()
    } else {

        DispatchQueue.main.async(execute: {
            completion()
        })
    }
}
