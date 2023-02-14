//
//  EditItemView.swift
//  FitSafe
//
//  Created by William Souef on 14/02/2023.
//

import SwiftUI

struct EditItemView: View {
    
    @Environment(\.dismiss) private var dismissed
    @ObservedObject var vm : EditItemViewModel
    
    var body: some View {
      
            NavigationStack {
                Text("My New Run ")
                    .font(.caption)
                    .fontWeight(.heavy)
                Slider(value:$vm.item.newRun, in: 0...1000,step: 2.0)
                    .padding(10)
                Text("\(Int(vm.item.newRun))km")
                    .padding()
                    .navigationTitle("Edit")
                    
            }.toolbar {
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

struct EditItemView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            EditItemView(vm: .init(provider: .shared))
        }
    }
}
