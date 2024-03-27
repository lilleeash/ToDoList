//
//  CoreDataManager.swift
//  ToDoList
//
//  Created by Darya Zhitova on 27.03.2024.
//

import Foundation
import CoreData

protocol CoreDataManagerProtocol {
    var persistentContainer: NSPersistentContainer { get }
    func saveContext()
}

final class CoreDataManager: CoreDataManagerProtocol {
    
    private let persistentContainerName: String
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: persistentContainerName)
        
        container.loadPersistentStores { storeDescription, error in
            if let error {
                print("Unresolved error \(error)")
            }
        }
        
        return container
    }()
    
    init(persistentContainerName: String) {
        self.persistentContainerName = persistentContainerName
    }
    
    func saveContext() {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            try? context.save()
        }
    }
}
