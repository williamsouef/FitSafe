//
//  ItemDetailView.swift
//  FitSafe
//
//  Created by William Souef on 07/02/2023.
//

import SwiftUI

struct ItemDetailView: View {
    
    
    let item : Item
    
    var body: some View {
        
    List {
            Section("general"){
                
                LabeledContent {
                    Text(item.name)
                } label: {
                    Text("Name")
                }
                
                LabeledContent {
                    Text("\(Int(item.capacity))km")
                } label: {
                    Text("Capacity")
                }
                LabeledContent {
                    Text("\(Int(item.newRun))km")
                } label: {
                    Text("Progression")
                }
            
             }
            
            
        }.navigationTitle("My Shoes")
            
        }
    }


//struct ItemDetailView_Previews: PreviewProvider {
//    static var previews: some View {
 //       NavigationStack {
 //           ItemDetailView()
 //       }
 //   }
//}
