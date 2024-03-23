//
//  AddTaskView.swift
//  ToDoList
//
//  Created by Darya Zhitova on 20.03.2024.
//

import UIKit

protocol AddTaskViewDelegate {
    func didSaveButtonTapped()
}

protocol AddTaskDisplayView: UIView {
    func setUpPickerData(with model: [AddTaskPickerData])
}

final class AddTaskView: UIView {
    
    private enum Constants {
        static let padding: CGFloat = 16
        static let cornerRadius: CGFloat = 10
        static let textFieldHeight: CGFloat = 48
    }
    
    var delegate: AddTaskViewDelegate?
    
    private lazy var titleTextField: UITextField = {
        let view = UITextField()
        view.placeholder = "Enter task title"
        view.backgroundColor = .white
        view.layer.cornerRadius = Constants.cornerRadius
        view.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: 0))
        view.leftViewMode = .always
        return view
    }()
    
    private lazy var descriptionTextField: UITextField = {
        let view = UITextField()
        view.placeholder = "Enter task description"
        view.backgroundColor = .white
        view.layer.cornerRadius = Constants.cornerRadius
        view.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: 0))
        view.leftViewMode = .always
        return view
    }()
    
    private lazy var saveButton: UIButton = {
        let view = UIButton()
        view.backgroundColor = .systemBlue
        view.titleLabel?.textColor = .white
        view.setTitle("Save", for: .normal)
        view.layer.cornerRadius = Constants.cornerRadius
        view.addTarget(
            self,
            action: #selector(didSaveButtonTapped),
            for: .touchUpInside
        )
        return view
    }()
    
    private lazy var picker: UIPickerView = {
        let view = UIPickerView()
        view.backgroundColor = .white
        view.layer.cornerRadius = Constants.cornerRadius
        view.delegate = dataPickerManager
        view.dataSource = dataPickerManager
        return view
    }()
    
    private lazy var dataPickerManager = AddTaskPickerManager()
    
    private lazy var dataPicker = UIDatePicker()
    
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

// MARK: AddTaskDisplayView
extension AddTaskView: AddTaskDisplayView {
    func setUpPickerData(with model: [AddTaskPickerData]) {
        dataPickerManager.dataPicker = model
    }
}

// MARK: private
private extension AddTaskView {
    
    @objc private func didSaveButtonTapped(sender: UIButton) {
        delegate?.didSaveButtonTapped()
        saveButton.layer.add(saveButtonAnimation, forKey: "saveButtonAnimation")
    }
    
    private func addSubviews() {
        [
            titleTextField,
            descriptionTextField,
            picker,
            dataPicker,
            saveButton
        ].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }
    }
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            titleTextField.leftAnchor
                .constraint(equalTo: leftAnchor, constant: Constants.padding),
            titleTextField.rightAnchor
                .constraint(equalTo: rightAnchor, constant: -Constants.padding),
            titleTextField.topAnchor
                .constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: Constants.padding),
            titleTextField.bottomAnchor
                .constraint(equalTo: descriptionTextField.topAnchor, constant: -Constants.padding),
            titleTextField.heightAnchor
                .constraint(equalToConstant: Constants.textFieldHeight)
        ])
        
        NSLayoutConstraint.activate([
            descriptionTextField.leftAnchor
                .constraint(equalTo: leftAnchor, constant: Constants.padding),
            descriptionTextField.rightAnchor
                .constraint(equalTo: rightAnchor, constant: -Constants.padding),
            descriptionTextField.topAnchor
                .constraint(equalTo: titleTextField.bottomAnchor, constant: Constants.padding),
            descriptionTextField.bottomAnchor
                .constraint(equalTo: picker.topAnchor, constant: -Constants.padding),
            descriptionTextField.heightAnchor
                .constraint(equalToConstant: Constants.textFieldHeight)
        ])
        
        NSLayoutConstraint.activate([
            picker.leftAnchor
                .constraint(equalTo: leftAnchor, constant: Constants.padding),
            picker.rightAnchor
                .constraint(equalTo: rightAnchor, constant: -Constants.padding),
            picker.topAnchor
                .constraint(equalTo: descriptionTextField.bottomAnchor, constant: Constants.padding),
            picker.bottomAnchor
                .constraint(equalTo: dataPicker.topAnchor, constant: -Constants.padding)
        ])
        
        NSLayoutConstraint.activate([
            dataPicker.leftAnchor
                .constraint(equalTo: leftAnchor, constant: Constants.padding),
            dataPicker.rightAnchor
                .constraint(equalTo: rightAnchor, constant: -Constants.padding),
            dataPicker.topAnchor
                .constraint(equalTo: picker.bottomAnchor, constant: Constants.padding),
            dataPicker.bottomAnchor
                .constraint(equalTo: saveButton.topAnchor, constant: -Constants.padding)
        ])
        
        NSLayoutConstraint.activate([
            saveButton.leftAnchor
                .constraint(equalTo: leftAnchor, constant: Constants.padding),
            saveButton.rightAnchor
                .constraint(equalTo: rightAnchor, constant: -Constants.padding),
            saveButton.topAnchor
                .constraint(equalTo: dataPicker.bottomAnchor, constant: Constants.padding),
            saveButton.bottomAnchor
                .constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -Constants.padding),
            saveButton.heightAnchor
                .constraint(equalToConstant: Constants.textFieldHeight)
        ])
    }
}
