//
//  ViaPlayTableViewSection.swift
//  HGViaPlaySections
//
//  Created by Hugo Coutinho on 2024-02-20.
//

import Foundation
import UIKit

// MARK: -SECTION OUTPUT -
protocol ViaPlayTableViewSectionOutput: SectionOutput {
    func navigateToDetails(domain: ViaPlaySection)
}

final class ViaPlayTableViewSection: Section {

    // MARK: - VARIABLE DELCARATIONS -
    weak var delegate: ViaPlayTableViewSectionOutput?
    var presenter: ViaPlaySectionPresenterInput!
    private var domain: ViaPlayDomain!

    // MARK: - CONSTRUCTORS -
    override init() {
        super.init()
        self.items = [NSObject()]
        self.domain = ViaPlayDomain()
    }

    // MARK: - INPUT METHODS -
    func startSection() {
        presenter.getSections()
    }
}

// MARK: - ASSISTANT METHODS -
extension ViaPlayTableViewSectionOutput {
    
}

// MARK: - TABLEVIEW SECTION INPUT -
extension ViaPlayTableViewSection: TableSectionCellInput {
    func didSelectCell(_ cell: UITableViewCell, at indexPath: IndexPath) {
        guard let domain = items[indexPath.row] as? ViaPlaySection else { return }
        delegate?.navigateToDetails(domain: domain)
    }
    
    func cell(for indexPath: IndexPath) -> UITableViewCell.Type {
        switch self.scene {
        case .sceneloading:
            return LoadingTableViewCell.self
        default:
            return ViaPlaySectionTableViewCell.self
        }
    }

    func willDisplayCell(_ cell: UITableViewCell, at indexPath: IndexPath) {
        guard let cell = cell as? ViaPlaySectionTableViewCell,
        let domain = items[indexPath.row] as? ViaPlaySection else { return }
        
        cell.setup(domain: domain)
    }
    
    func estimatedRowHeight() -> CGFloat {
        return 150
    }
}

// MARK: - PRESENTER OUTPUT -
extension ViaPlayTableViewSection: ViaPlaySectionPresenterOutput {
     func handleSuccess(domain: ViaPlayDomain) {
        self.domain.sections = domain.sections
        items = domain.sections
        scene = .sceneSuccess
        output?.reloadSection(section: self, animation: .automatic)
    }

     func removeSection() {
        self.output?.removeItem(from: 0, in: self, animation: .fade, completion: nil)
    }
}



