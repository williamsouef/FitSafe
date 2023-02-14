//
//  CreateItemView.swift
//  FitSafe
//
//  Created by William Souef on 07/02/2023.
//

import SwiftUI

struct CreateItemView: View {
    
    
    @Environment(\.dismiss) private var dismissed
    @ObservedObject var vm : EditItemViewModel
    
    var body: some View {
        
            
        List {
            NavigationStack {
                
                
                if vm.isNew {
                    
                    TextField("Name", text: $vm.item.name)
                        .keyboardType(.namePhonePad)
                        .padding()
                    
                    
                    
                    Text("My Total Capacity")
                        .font(.caption)
                        .fontWeight(.heavy)
                        
                    
                    Slider(value:$vm.item.capacity, in: 0...1000,step: 2.0)
                        .padding(10)
                    Text("\(Int(vm.item.capacity))km")
                        .padding()
                    
                } else {
                    
                       Text("My New Run ")
                          .font(.caption)
                          .fontWeight(.heavy)
                      Slider(value:$vm.item.newRun, in: 0...1000,step: 2.0)
                          .padding(10)
                    Text("\(Int(vm.item.newRun))km")
                         .padding()
                    
                }
                    Spacer()
        
                    
                    .navigationTitle(vm.isNew ? "Create New Shoes" : "New Run")
                }  .toolbar {
                    ToolbarItem(placement:.confirmationAction) {
                        Button("Done"){
                            do {
                                try vm.save()
                                dismissed()
                            } catch {
                                print(error)
                            }
                        }
                    }
                    ToolbarItem(placement:.navigationBarLeading) {
                        Button("Cancel"){
                            dismissed()
                        }
                    }
            }
        }
        }
    }


struct CreateItemView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            CreateItemView(vm: .init(provider: .shared))
        }
    }
}
