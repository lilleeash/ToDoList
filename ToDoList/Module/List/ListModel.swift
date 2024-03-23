//
//  ListModel.swift
//  ToDoList
//
//  Created by Darya Zhitova on 15.03.2024.
//

import Foundation

struct ListModel {
    let id: Int
    let title: String
    let description: String
    let date: Date
    let category: AddTaskPickerData
    let isCompleted: Bool
}

final class ListModelGenerator {
    static func getData() -> [ListModel] {
        var array: [ListModel] = []
        
        for i in 1...10 {
            array.append(
                ListModel(
                    id: i,
                    title: "Title \(i)",
                    description: "Description",
                    date: Date(),
                    category: .study,
                    isCompleted: false
                )
            )
        }
        
        return array
    }
}
