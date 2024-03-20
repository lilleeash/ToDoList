//
//  ListView.swift
//  ToDoList
//
//  Created by Darya Zhitova on 15.03.2024.
//

import UIKit

protocol ListViewDelegate {
    func searchBar(textDidChange searchText: String)
    
    func didSelectRow(_ model: ListModel)
}

protocol DisplayListView: UIView {
    func configure(with model: [ListModel])
}

final class ListView: UIView {
    
    enum Constants {
        static let padding: CGFloat = 16
    }
    
    var delegate: ListViewDelegate?
    
    private lazy var tableView: UITableView = {
        let view = UITableView(frame: .zero, style: .insetGrouped)
        view.delegate = tableManager
        view.dataSource = tableManager
        view.register(ListTableViewCell.self, forCellReuseIdentifier: ListTableViewCell.identifier)
        return view
    }()
    
    private lazy var searchBar: UISearchBar = {
        let view = UISearchBar()
        view.placeholder = "Enter task name"
        view.delegate = searchManager
        view.searchBarStyle = .minimal
        return view
    }()
    
    private var tableManager: ListTableManager = ListTableManager()
    private var searchManager: ListSearchManager = ListSearchManager()
    
    init() {
        super.init(frame: .zero)
        addSubviews()
        setUpConstraints()
        searchManager.delegate = self
        tableManager.delegate = self
        backgroundColor = .systemGroupedBackground
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

// MARK: ListSearchManagerDelegate
extension ListView: ListSearchManagerDelegate {
    func searchBar(textDidChange searchText: String) {
        delegate?.searchBar(textDidChange: searchText)
    }
}

// MARK: ListTableManagerDelegate
extension ListView: ListTableManagerDelegate {
    func didSelectRow(_ model: ListModel) {
        delegate?.didSelectRow(model)
    }
}

// MARK: private
private extension ListView {
    
    private func addSubviews() {
        [tableView, searchBar].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }
    }
    
    private func setUpConstraints() {
        
        NSLayoutConstraint.activate([
            searchBar.leadingAnchor.constraint(equalTo: leadingAnchor),
            searchBar.trailingAnchor.constraint(equalTo: trailingAnchor),
            searchBar.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            searchBar.bottomAnchor
                .constraint(equalTo: tableView.topAnchor, constant: -Constants.padding)
        ])
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.topAnchor
                .constraint(equalTo: searchBar.bottomAnchor, constant: Constants.padding),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
