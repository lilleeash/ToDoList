//
//  ListViewController.swift
//  ToDoList
//
//  Created by Darya Zhitova on 15.03.2024.
//

import UIKit

final class ListViewController: UIViewController {
    
    private var tasks: [ListModel] = []
    
    private let provider: ListDataProviderProtocol
    
    private lazy var contentView: DisplayListView = {
        let view = ListView()
        view.delegate = self
        return view
    }()
    
    init(provider: ListDataProviderProtocol) {
        self.provider = provider
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
        setUpNavigation()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tasks = provider.fetchTasks()
        contentView.configure(with: tasks)
    }

}

extension ListViewController: ListViewDelegate {
    func didSelectRow(_ model: ListModel) {
        let controller: TaskDetailViewControllerProtocol = TaskDetailViewController(task: model)
        controller.configure(with: model)
        navigationController?.pushViewController(controller, animated: true)
    }
    
    func searchBar(textDidChange searchText: String) {
        var filtered: [ListModel] = []
        
        guard !searchText.isEmpty else {
            contentView.configure(with: tasks)
            return
        }
        
        for task in tasks {
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
        let name: String = "ListCoreDataModel"
        
        let coreDataManager: CoreDataManagerProtocol = CoreDataManager(persistentContainerName: name)
        
        let provider: AddTaskDataProviderProtocol = AddTaskDataProvider(coreDataManager: coreDataManager)
        
        let controller: UIViewController = AddTaskViewController(provider: provider)
        
        navigationController?.pushViewController(controller, animated: true)
    }
}
