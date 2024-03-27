//
//  ListDataProvider.swift
//  ToDoList
//
//  Created by Darya Zhitova on 27.03.2024.
//

import Foundation
import CoreData

protocol ListDataProviderProtocol {
    func fetchTasks() -> [ListModel]
}

final class ListDataProvider: ListDataProviderProtocol {
    
    private let coreDataManager: CoreDataManagerProtocol
    private let context: NSManagedObjectContext
    
    init(coreDataManager: CoreDataManagerProtocol) {
        self.coreDataManager = coreDataManager
        self.context = coreDataManager.persistentContainer.viewContext
    }
    
    func fetchTasks() -> [ListModel] {
        let fetchRequest: NSFetchRequest<ListCoreDataModel> = ListCoreDataModel.fetchRequest()
        
        guard let fetchedData = try? context.fetch(fetchRequest) else { return [] }
        
        let viewModel = fetchedData.map {
            ListModel(
                id: $0.id ?? UUID(),
                title: $0.title ?? "",
                description: $0.subtitle ?? "",
                date: $0.date ?? Date(),
                category: AddTaskPickerData(rawValue: $0.category ?? "") ?? .other,
                isCompleted: $0.isCompleted
            )
        }
        
        return viewModel
    }
}
