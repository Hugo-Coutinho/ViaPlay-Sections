//
//  ViaPlaySectionTableViewCell.swift
//  HGViaPlaySections
//
//  Created by Hugo Coutinho on 2024-02-20.
//

import Foundation
import UIKit

class ViaPlaySectionTableViewCell: UITableViewCell {

    // MARK: - DEFINING UI ELEMENTS -
    private lazy var sectionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.textAlignment = .center
        label.backgroundColor = .lightGray
        return label
    }()

    // MARK: - OVERRIDE -
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupComponents()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupComponents()
    }

    // MARK: - SETUP -
    func setup(domain: ViaPlaySection) {
        sectionLabel.text = domain.title
    }

    private enum Constants: String {
        case successStatus = "Successed"
        case failedstatus = "Failed"
    }
}

// MARK: - UI -
extension ViaPlaySectionTableViewCell {
    private func setupComponents() {
        contentView.addSubview(sectionLabel)
        activateConstraints()
    }

    private func activateConstraints() {
        NSLayoutConstraint.activate([
            sectionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 64),
            sectionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -64),
            sectionLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            sectionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
        ])
    }
}
