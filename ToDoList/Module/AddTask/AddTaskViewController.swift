//
//  AddTaskViewController.swift
//  ToDoList
//
//  Created by Darya Zhitova on 20.03.2024.
//

import UIKit

final class AddTaskViewController: UIViewController {
    
    private let provider: AddTaskDataProviderProtocol
    
    private lazy var contentView: AddTaskDisplayView = {
        let view = AddTaskView()
        view.delegate = self
        return view
    }()
    
    init(provider: AddTaskDataProviderProtocol) {
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
        contentView.setUpPickerData(with: AddTaskPickerData.allCases)
    }
}

extension AddTaskViewController: AddTaskViewDelegate {
    func didSaveButtonTapped(model: ListModel) {
        provider.createTask(with: model)
        navigationController?.popViewController(animated: true)
    }
}
