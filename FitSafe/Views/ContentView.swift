//
//  ContentView.swift
//  FitSafe
//
//  Created by William Souef on 07/02/2023.
//

import SwiftUI

struct ContentView: View {
    
    
    @State private var itemToEdtit : Item?
    @FetchRequest(fetchRequest: Item.all()) private var items
    var provider = ItemsProvider.shared
    
 
    
    var body: some View {
        NavigationStack {
            ZStack{
                if items.isEmpty {
                    NoShoesView()
                } else {
                    List {
                        ForEach(items) { item in
                            
                        
                            ZStack(alignment: .leading) {
                                
                                NavigationLink(destination: ItemDetailView(item: item)) {
                                    EmptyView()
                                }.opacity(0)
                                
                                ItemRowView(item: item)
                                    .swipeActions(allowsFullSwipe: true){
                                        Button(role:.destructive){
                                            
                                                do{
                                                 try  deleteItem(item)
                                                } catch {
                                                    print(error)
                                                }
                                            
                                        } label: {
                                            Label("Delete", systemImage: "trash")
                                        }
                                        .tint(.red)
                                        Button{
                                            itemToEdtit = item
                                           // EditItemView(vm: .init(provider: provider, item: item))
                                        } label: {
                                            Label("New Run", systemImage: "pencil")
                                        }
                                        
                                        .tint(.orange)
                                    }
                            }
                      
                        }
                    }

                }
            }.toolbar {
                ToolbarItem(placement:.primaryAction) {
                    Button {
                        itemToEdtit = .empty(context: provider.newContext)
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }.sheet(item: $itemToEdtit, onDismiss: {itemToEdtit = nil}, content: { item in
                NavigationStack {
                    CreateItemView(vm: .init(provider: provider, item: item))
                }
            } )
            
            .navigationTitle("Shoes")
            
        }
    }
}


private extension ContentView {
    
    func deleteItem(_ item : Item) throws {
        let context = provider.viewContext
        let existingObject = try context.existingObject(with: item.objectID)
        context.delete(existingObject)
        Task(priority: .background) {
            try await context.perform {
                try context.save()
            }
        }
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
