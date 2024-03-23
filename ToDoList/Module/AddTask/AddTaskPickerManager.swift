//
//  AddTaskPickerManager.swift
//  ToDoList
//
//  Created by Darya Zhitova on 22.03.2024.
//

import UIKit

final class AddTaskPickerManager: NSObject {
    var dataPicker: [AddTaskPickerData] = []
}

// MARK: UIPickerViewDelegate, UIPickerViewDataSource
extension AddTaskPickerManager: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(
        _ pickerView: UIPickerView,
        numberOfRowsInComponent component: Int
    ) -> Int {
        return dataPicker.count
    }
    
    func pickerView(
        _ pickerView: UIPickerView,
        titleForRow row: Int,
        forComponent component: Int
    ) -> String? {
        let title = dataPicker[row].rawValue
        return title
    }
}
