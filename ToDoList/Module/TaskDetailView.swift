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
    
    private lazy var categoryLabel: UILabel = {
        let view = UILabel()
        view.font = .systemFont(ofSize: 15)
        view.textColor = .white
        return view
    }()
    
    private lazy var isCompletedLabel: UILabel = {
        let view = UILabel()
        view.font = .systemFont(ofSize: 15)
        view.textColor = .white
        return view
    }()
    
    private lazy var image: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "person.fill"))
        return imageView
    }()
    
    private let stack: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.spacing = 4
        view.alignment = .leading
        return view
    }()
    
    private lazy var saveButton: UIButton = {
        let view = UIButton()
        view.backgroundColor = .systemBlue
        view.titleLabel?.textColor = .white
        view.setTitle("Save", for: .normal)
        view.layer.cornerRadius = 10
        return view
    }()
    
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
    
    private lazy var descriptionLabel: UILabel = {
        let view = UILabel()
        return view
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
        
    }
}

private extension TaskDetailView {
    private func addSubviews() {
        
    }
    
    private func setUpConstraints() {
        
    }
}

