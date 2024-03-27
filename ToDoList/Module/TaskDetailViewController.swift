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
    
    private let task: ListModel
    
    private lazy var contentView: TaskDetailDisplayView = {
        let view = TaskDetailView()
        return view
    }()
    
    init(task: ListModel) {
        self.task = task
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contentView.configure(with: task)
    }
}

extension TaskDetailViewController: TaskDetailViewControllerProtocol {
    func configure(with model: ListModel) {
        navigationItem.title = model.title
    }
}
