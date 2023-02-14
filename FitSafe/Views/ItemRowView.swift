//
//  ItemRowView.swift
//  FitSafe
//
//  Created by William Souef on 07/02/2023.
//

import SwiftUI

struct ItemRowView: View {
    
    @Environment(\.managedObjectContext) private var moc
    
   @ObservedObject var item : Item
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8){
            Text(item.name)
                .font(.title)
            ProgressView(value: item.newRun, total: item.capacity)

            Text("Actual progression: \(Int(item.newRun))Km")
            Text("Capacity: \(Int(item.capacity))Km")
                .font(.caption)
            
        }.frame(maxWidth:.infinity,alignment: .leading)
            
    }
}



