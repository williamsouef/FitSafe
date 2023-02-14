//
//  NoShoesView.swift
//  FitSafe
//
//  Created by William Souef on 08/02/2023.
//

import SwiftUI

struct NoShoesView: View {
    var body: some View {
        VStack{
            Text("🧐 Couldn't find any Shoes")
                .fontWeight(.black)
                .padding()
            Text("Press the + button to add your first Shoes !")
        }
    }
}

struct NoShoesView_Previews: PreviewProvider {
    static var previews: some View {
        NoShoesView()
    }
}
