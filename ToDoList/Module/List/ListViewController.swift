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

private extension ListViewController {
    
    private func setUpNavigation() {
        navigationItem.title = "ToDo list"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = .init(systemItem: .add)
    }
}

