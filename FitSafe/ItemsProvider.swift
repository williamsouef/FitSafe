//
//  ItemsProvider.swift
//  FitSafe
//
//  Created by William Souef on 07/02/2023.
//

import Foundation
import CoreData


//MARK: LOADING DATA AND INTERACTION WITH CORE DATA MODEL STACK

final class ItemsProvider {
    
    
    //main instance to interact with CoreData
    static let shared = ItemsProvider()
    
    
    //access and load the data
    private let persistenceContainer : NSPersistentContainer
    
    // variable to be able to inject coredata into the view
    var viewContext : NSManagedObjectContext {
        persistenceContainer.viewContext
    }
    var newContext : NSManagedObjectContext {
        persistenceContainer.newBackgroundContext()
    }

    private  init() {
        //loading to the good reference Name
        
         persistenceContainer = NSPersistentContainer(name: "ItemsDataModel")
        
        // every time that commit it automatically save and merge into the main context which is the viewcontext
        
         persistenceContainer.viewContext.automaticallyMergesChangesFromParent = true
        
        // Start loading the data
        
         persistenceContainer.loadPersistentStores { _, error in
             
            if let error {
                fatalError("Unable to load data with error: \(error) ")
            }
        }
     }

    
    
    func exist(_ item: Item, in context: NSManagedObjectContext) -> Item? {
        try? context.existingObject(with: item.objectID) as? Item
    }
    func delete(_ item: Item, in context: NSManagedObjectContext) throws {
        if let existingContact = exist(item, in: context) {
            context.delete(existingContact)
            Task(priority: .background) {
                try await context.perform {
                    try context.save()
                }
            }
        }
    }
    
    func persist(in context: NSManagedObjectContext) throws {
        if context.hasChanges {
          try context.save()
        }
    }
    
    
    
    
    
}




