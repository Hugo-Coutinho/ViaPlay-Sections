//
//  ViaPlayDomain.swift
//  HGViaPlaySections
//
//  Created by Hugo Coutinho on 2024-02-20.
//

import Foundation

struct ViaPlayDomain {
    var sections: ViaPlaySectionSections = []
    
    init() {}
    
    init(sections: ViaplaySectionsEntity) {
        self.sections = sections
            .sorted(by: { (lItem: ViaplaySectionEntity, rItem: ViaplaySectionEntity) -> Bool in
                return lItem.sectionSort < rItem.sectionSort })
        
            .map({ (section) -> ViaPlaySection in
            return ViaPlaySection(title: section.title, description: section.name)
        })
    }
}

struct ViaPlaySection {
    let title, description: String
}

typealias ViaPlaySectionSections = [ViaPlaySection]
