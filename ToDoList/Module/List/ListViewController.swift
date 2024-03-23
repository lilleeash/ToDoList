//
//  ListViewController.swift
//  ToDoList
//
//  Created by Darya Zhitova on 15.03.2024.
//

import UIKit

final class ListViewController: UIViewController {
    
    private lazy var contentView: DisplayListView = {
        let view = ListView()
        view.delegate = self
        return view
    }()
    
    override func loadView() {
        view = contentView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavigation()
        contentView.configure(with: ListModelGenerator.getData())
    }

}

extension ListViewController: ListViewDelegate {
    func didSelectRow(_ model: ListModel) {
        let controller: TaskDetailViewControllerProtocol = TaskDetailViewController()
        controller.configure(with: model)
        navigationController?.pushViewController(controller, animated: true)
    }
    
    func searchBar(textDidChange searchText: String) {
        var filtered: [ListModel] = []
        
        if searchText.isEmpty {
            contentView.configure(with: ListModelGenerator.getData())
        }
        
        for task in ListModelGenerator.getData() {
            if task.title.lowercased().contains(searchText.lowercased()) {
                filtered.append(task)
            }
        }
        
        contentView.configure(with: filtered)
    }
}

private extension ListViewController {
    
    private func setUpNavigation() {
        navigationItem.title = "ToDo list"
        navigationItem.rightBarButtonItem = .init(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(didAddButtonTapped)
        )
    }
    
    @objc private func didAddButtonTapped(sender: UIButton) {
        let controller: UIViewController = AddTaskViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
}
