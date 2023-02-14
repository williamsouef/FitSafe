//
//  EditItemViewModel.swift
//  FitSafe
//
//  Created by William Souef on 07/02/2023.
//

import Foundation
import CoreData



final class EditItemViewModel : ObservableObject {
    
    @Published var item : Item
    let isNew : Bool
    
    private var context : NSManagedObjectContext
    
    init(provider: ItemsProvider, item: Item? = nil) {
        self.context = provider.newContext
        if let item,
           let existingItemCopy = try? context.existingObject(with: item.objectID) as? Item {
            self.item = existingItemCopy
            self.isNew = false
        } else {
            self.item = Item(context: context.self)
            self.isNew = true
        }
       
        
    }
    
    
    func save () throws {
        if context.hasChanges {
            
            try context.save()
        }
    }
    
    
}
