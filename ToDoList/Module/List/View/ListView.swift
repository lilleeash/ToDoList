//
//  ListView.swift
//  ToDoList
//
//  Created by Darya Zhitova on 15.03.2024.
//

import UIKit

protocol DisplayListView: UIView {
    func configure(with model: [ListModel])
}

final class ListView: UIView {
    
    private lazy var tableView: UITableView = {
        let view = UITableView()
        view.delegate = tableManager
        view.dataSource = tableManager
        view.register(ListTableViewCell.self, forCellReuseIdentifier: ListTableViewCell.identifier)
        return view
    }()
    
    private var tableManager: ListTableManager = ListTableManager()
    
    init() {
        super.init(frame: .zero)
        addSubviews()
        setUpConstraints()
        backgroundColor = .systemBackground
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}

// MARK: DisplayListView
extension ListView: DisplayListView {
    func configure(with model: [ListModel]) {
        tableManager.tableData = model
        tableView.reloadData()
    }
}

private extension ListView {
    
    private func addSubviews() {
        [tableView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }
    }
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
