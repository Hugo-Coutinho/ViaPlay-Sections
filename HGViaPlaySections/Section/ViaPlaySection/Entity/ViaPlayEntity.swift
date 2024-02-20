//
//  ViaPlayEntity.swift
//  HGViaPlaySections
//
//  Created by Hugo Coutinho on 2024-02-20.
//

import Foundation

typealias ViaplaySectionsEntity = [ViaplaySectionEntity]

// MARK: - ViaplayResult
struct ViaplayResult: Codable {
    let links: Links
    
    enum CodingKeys: String, CodingKey {
        case links = "_links"
    }
}

// MARK: - Links
struct Links: Codable {
    let viaplaySections: ViaplaySectionsEntity
    
    enum CodingKeys: String, CodingKey {
        case viaplaySections = "viaplay:sections"
    }
}

// MARK: - ViaplaySectionEntity
struct ViaplaySectionEntity: Codable {
    let title, href, name: String
    let sectionSort: Int
    
    enum CodingKeys: String, CodingKey {
        case title, href, name
        case sectionSort = "sectionSort"
    }
}
