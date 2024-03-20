//
//  TaskDetailView.swift
//  ToDoList
//
//  Created by Darya Zhitova on 20.03.2024.
//

import UIKit

final class TaskDetailView: UIView {
    
    init() {
        super.init(frame: .zero)
        backgroundColor = .systemPink
        addSubviews()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

private extension TaskDetailView {
    private func addSubviews() {
        
    }
    
    private func setUpConstraints() {
        
    }
}

