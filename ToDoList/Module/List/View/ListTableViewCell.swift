//
//  ListTableViewCell.swift
//  ToDoList
//
//  Created by Darya Zhitova on 15.03.2024.
//

import UIKit

final class ListTableViewCell: UITableViewCell {
    
    private enum Constants {
        static let padding: CGFloat = 8
    }
    
    private let titleLabel: UILabel = {
        let view = UILabel()
        return view
    }()
    
    private let descriptionLabel: UILabel = {
        let view = UILabel()
        view.font = .systemFont(ofSize: 15)
        view.textColor = .gray
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func configure(with model: ListModel) {
        titleLabel.text = model.title
        descriptionLabel.text = model.description
    }
}

private extension ListTableViewCell {
    
    private func addSubviews() {
        [titleLabel, descriptionLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview($0)
        }
    }
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor
                .constraint(equalTo: leadingAnchor, constant: Constants.padding),
            titleLabel.trailingAnchor
                .constraint(equalTo: trailingAnchor, constant: -Constants.padding),
            titleLabel.topAnchor
                .constraint(equalTo: topAnchor, constant: Constants.padding),
            titleLabel.bottomAnchor
                .constraint(equalTo: descriptionLabel.topAnchor, constant: -Constants.padding)
        ])
        
        NSLayoutConstraint.activate([
            descriptionLabel.leadingAnchor
                .constraint(equalTo: leadingAnchor, constant: Constants.padding),
            descriptionLabel.trailingAnchor
                .constraint(equalTo: trailingAnchor, constant: -Constants.padding),
            descriptionLabel.bottomAnchor
                .constraint(equalTo: bottomAnchor, constant: -Constants.padding),
            descriptionLabel.topAnchor
                .constraint(equalTo: titleLabel.bottomAnchor, constant: Constants.padding),
        ])
    }
}
