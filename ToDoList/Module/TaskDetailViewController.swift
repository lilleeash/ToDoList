//
//  TaskDetailViewController.swift
//  ToDoList
//
//  Created by Darya Zhitova on 20.03.2024.
//

import UIKit

protocol TaskDetailViewControllerProtocol: UIViewController {
    func configure(with model: ListModel)
}

final class TaskDetailViewController: UIViewController {
    
    private lazy var contentView: TaskDetailDisplayView = {
        let view = TaskDetailView()
        return view
    }()
    
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension TaskDetailViewController: TaskDetailViewControllerProtocol {
    func configure(with model: ListModel) {
        navigationItem.title = model.title
    }
}
