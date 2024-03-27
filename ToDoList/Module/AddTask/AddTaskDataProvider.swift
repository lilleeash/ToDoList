//
//  AddTaskDataProvider.swift
//  ToDoList
//
//  Created by Darya Zhitova on 27.03.2024.
//

import Foundation
import CoreData

protocol AddTaskDataProviderProtocol {
    func createTask(with model: ListModel)
}

final class AddTaskDataProvider: AddTaskDataProviderProtocol {
    
    private let coreDataManager: CoreDataManagerProtocol
    
    init(coreDataManager: CoreDataManagerProtocol) {
        self.coreDataManager = coreDataManager
    }
    
    func createTask(with model: ListModel) {
        let context = coreDataManager.persistentContainer.viewContext
        
        let task: ListCoreDataModel = ListCoreDataModel(context: context)
        
        task.id = model.id
        task.title = model.title
        task.subtitle = model.description
        task.date = model.date
        task.isCompleted = model.isCompleted
        task.category = model.category.rawValue
        
        coreDataManager.saveContext()
    }
}
