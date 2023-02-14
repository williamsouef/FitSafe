//
//  Item.swift
//  FitSafe
//
//  Created by William Souef on 07/02/2023.
//

import Foundation
import CoreData



final class Item : NSManagedObject, Identifiable {
    
    @NSManaged var name : String
    @NSManaged var capacity : Double
    @NSManaged var newRun : Double
}
extension Item {
    
    static var itemsFetchRequest : NSFetchRequest<Item> {
        NSFetchRequest(entityName: "Item")
    }
    
    static func all() -> NSFetchRequest<Item> {
        
        let request : NSFetchRequest<Item> = itemsFetchRequest
        request.sortDescriptors = [ NSSortDescriptor(keyPath: \Item.name, ascending: true)]
        return request
    }
}

extension Item {
    static func empty(context:NSManagedObjectContext = ItemsProvider.shared.viewContext) -> Item {
         return Item(context: context)
     }
}
