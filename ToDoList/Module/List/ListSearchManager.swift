//
//  ListSearchManager.swift
//  ToDoList
//
//  Created by Darya Zhitova on 20.03.2024.
//

import UIKit

protocol ListSearchManagerDelegate {
    func searchBar(textDidChange searchText: String)
}

final class ListSearchManager: NSObject {
    var delegate: ListSearchManagerDelegate?
}

extension ListSearchManager: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        delegate?.searchBar(textDidChange: searchText)
    }
}
