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
    
    private let stack: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 4
        view.alignment = .leading
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
            stack.addArrangedSubview($0)
        }
        
        [stack].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview($0)
        }
    }
    
    private func setUpConstraints() {
        
        NSLayoutConstraint.activate([
            stack.leadingAnchor
                .constraint(equalTo: leadingAnchor, constant: Constants.padding),
            stack.trailingAnchor
                .constraint(equalTo: trailingAnchor, constant: -Constants.padding),
            stack.topAnchor
                .constraint(equalTo: topAnchor, constant: Constants.padding),
            stack.bottomAnchor
                .constraint(equalTo: bottomAnchor, constant: -Constants.padding)
        ])
    }
}
