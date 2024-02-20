//
//  LoadingTableViewCell.swift
//  SpaceX
//
//  Created by hugo.coutinho on 16/12/21.
//  Copyright © 2021 . All rights reserved.
//

import UIKit

 class LoadingTableViewCell: UITableViewCell {
    // MARK: - UI ELEMENTS -
    private lazy var spinner: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.medium)
        activityIndicator.hidesWhenStopped = true
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.startAnimating()
        return activityIndicator
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
}

// MARK: - UI -
extension LoadingTableViewCell {
    private func setupComponents() {
        contentView.addSubview(spinner)
        activateConstraints()
    }

    private func activateConstraints() {
        NSLayoutConstraint.activate([
            spinner.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            spinner.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            spinner.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            spinner.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
        ])
    }
}
