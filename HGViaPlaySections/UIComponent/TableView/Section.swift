//
//  Section.swift
//  SpaceX
//
//  Created by hugo.coutinho on 16/12/21.
//  Copyright © 2021 . All rights reserved.
//

import Foundation

open class Section: NSObject {
     weak var output: SectionOutput?
     var items: [Any] = []
     var scene: SectionsScenes = .sceneloading
}

 enum SectionsScenes {
    case sceneloading
    case sceneError
    case sceneSuccess
}
