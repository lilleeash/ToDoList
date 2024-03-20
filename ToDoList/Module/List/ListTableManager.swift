//
//  ListTableManager.swift
//  ToDoList
//
//  Created by Darya Zhitova on 15.03.2024.
//

import UIKit

final class ListTableManager: NSObject {
    var tableData: [ListModel] = []
}

// MARK: UITableViewDelegate, UITableViewDataSource
extension ListTableManager: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        tableData.count
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        
        let model: ListModel = tableData[indexPath.row]
        
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: ListTableViewCell.identifier,
            for: indexPath
        ) as? ListTableViewCell else {
            return UITableViewCell()
        }
        
        cell.configure(with: model)
        
        return cell
    }
}
