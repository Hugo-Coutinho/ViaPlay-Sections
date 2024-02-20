//
//  HomeViewController.swift
//  HGViaPlaySections
//
//  Created by Hugo Coutinho on 2024-02-20.
//

import UIKit

class HomeViewController: TableViewController {

    // MARK: - HOME PROPERTIES -
    var homeSections: [Section] = []
    var presenter: ViaPlayPresenter?

    // MARK: - LIFE CYCLE -
    override func viewWillLayoutSubviews() {
        title = Constant.Home.title
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        homeSections.forEach({ sections.append($0) })
        tableView.reloadData()
    }
}

// MARK: -SECTION OUTPUT -
extension HomeViewController: ViaPlayTableViewSectionOutput {
    func navigateToDetails(domain: ViaPlaySection) {
        presenter?.goToDetails(domain: domain)
    }
}


 struct Constant {
     struct Home {
         static let title = "ViaPlay"
    }
}
