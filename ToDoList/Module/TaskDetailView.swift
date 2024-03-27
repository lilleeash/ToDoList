//
//  TaskDetailView.swift
//  ToDoList
//
//  Created by Darya Zhitova on 20.03.2024.
//

import UIKit

protocol TaskDetailDisplayView: UIView {
    func configure(with model: ListModel)
}

final class TaskDetailView: UIView {
    
    private enum Constants {
        static let cornerRadius: CGFloat = 15
    }
    
    // MARK: Backgrounds
    
    private lazy var categoryBackground: UIView = {
        let view = UIView()
        view.layer.cornerRadius = Constants.cornerRadius
        return view
    }()
    
    private lazy var statusBackground: UIView = {
        let view = UIView()
        view.layer.cornerRadius = Constants.cornerRadius
        return view
    }()
    
    private lazy var descriptionBackground: UIView = {
        let view = UIView()
        view.layer.cornerRadius = Constants.cornerRadius
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var dateBackground: UIView = {
        let view = UIView()
        view.layer.cornerRadius = Constants.cornerRadius
        view.backgroundColor = .white
        return view
    }()
    
    // MARK: Button
    
    private lazy var saveButton: UIButton = {
        let view = UIButton()
        view.backgroundColor = .systemBlue
        view.titleLabel?.textColor = .white
        view.setTitle("Complete task", for: .normal)
        view.layer.cornerRadius = Constants.cornerRadius
        return view
    }()
    
    // MARK: Animation
    
    private let saveButtonAnimation: CASpringAnimation = {
        let animation = CASpringAnimation(keyPath: "transform.scale")
        animation.fromValue = 1
        animation.toValue = 1.03
        animation.duration = 0.5
        animation.damping = 1.5
        animation.mass = 5
        animation.autoreverses = true
        return animation
    }()

    
    init() {
        super.init(frame: .zero)
        backgroundColor = .systemGroupedBackground
        addSubviews()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

extension TaskDetailView: TaskDetailDisplayView {
    func configure(with model: ListModel) {
        
        statusBackground.backgroundColor = model.isCompleted ? .systemGreen : .systemRed
        
        switch model.category {
        case .family:
            categoryBackground.backgroundColor = .systemCyan
        case .frieds:
            categoryBackground.backgroundColor = .systemPurple
        case .study:
            categoryBackground.backgroundColor = .systemGreen
        case .work:
            categoryBackground.backgroundColor = .systemOrange
        case .other:
            categoryBackground.backgroundColor = .systemYellow
        }
    }
}

private extension TaskDetailView {
    private func addSubviews() {
        [
            categoryBackground,
            statusBackground,
            descriptionBackground,
            dateBackground,
            saveButton
        ].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }
    }
    
    private func setUpConstraints() {
        // MARK: Category constraint
        
        NSLayoutConstraint.activate([
            categoryBackground.heightAnchor
                .constraint(equalToConstant: 50),
            
            categoryBackground.widthAnchor
                .constraint(equalTo: widthAnchor, multiplier: 0.43),
            
            categoryBackground.leadingAnchor
                .constraint(equalTo: leadingAnchor, constant: 16),
            
            categoryBackground.topAnchor
                .constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16)
        ])
        
        // MARK: Status constraint
        
        NSLayoutConstraint.activate([
            statusBackground.heightAnchor
                .constraint(equalToConstant: 50),
            
            statusBackground.widthAnchor
                .constraint(equalTo: widthAnchor, multiplier: 0.43),
            
            statusBackground.trailingAnchor
                .constraint(equalTo: trailingAnchor, constant: -16),
            
            statusBackground.topAnchor
                .constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16)
        ])
        
        // MARK: Description constraint
        
        NSLayoutConstraint.activate([
            descriptionBackground.heightAnchor
                .constraint(equalToConstant: 100),
            
            descriptionBackground.leadingAnchor
                .constraint(equalTo: leadingAnchor, constant: 16),
            
            descriptionBackground.trailingAnchor
                .constraint(equalTo: trailingAnchor, constant: -16),
            
            descriptionBackground.topAnchor
                .constraint(equalTo: categoryBackground.bottomAnchor, constant: 16),
            
            descriptionBackground.bottomAnchor
                .constraint(equalTo: dateBackground.topAnchor, constant: -16)
        ])
        
        // MARK: Date constraint
        
        NSLayoutConstraint.activate([
            dateBackground.heightAnchor.constraint(equalToConstant: 50),
            
            dateBackground.leadingAnchor
                .constraint(equalTo: leadingAnchor, constant: 16),
            
            dateBackground.trailingAnchor
                .constraint(equalTo: trailingAnchor, constant: -16),
            
            dateBackground.topAnchor
                .constraint(equalTo: descriptionBackground.bottomAnchor, constant: 16),
        ])
        
        // MARK: Button
        
        NSLayoutConstraint.activate([
            saveButton.heightAnchor.constraint(equalToConstant: 50),
            
            saveButton.leadingAnchor
                .constraint(equalTo: leadingAnchor, constant: 16),
            
            saveButton.trailingAnchor
                .constraint(equalTo: trailingAnchor, constant: -16),
            
            saveButton.bottomAnchor
                .constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -16)
        ])
    }
}

