//
//  AddTaskViewController.swift
//  ToDoList
//
//  Created by Darya Zhitova on 20.03.2024.
//

import UIKit

final class AddTaskViewController: UIViewController {
    
    private lazy var contentView: AddTaskView = {
        let view = AddTaskView()
        view.delegate = self
        return view
    }()
    
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension AddTaskViewController: AddTaskViewDelegate {
    func didSaveButtonTapped() {
        print("Save content")
    }
}
