//
//  ItemDetail.swift
//  iDine
//
//  Created by Chelsie Eiden on 2/7/20.
//  Copyright © 2020 Chelsie Eiden. All rights reserved.
//

import SwiftUI

struct ItemDetail: View {
    var item: MenuItem
    
    @EnvironmentObject var order: Order
    
    var body: some View {
        VStack {
            ZStack(alignment: .bottomTrailing){
                Image(item.mainImage)
                Text("Photo: \(item.photoCredit)")
                    .padding(4)
                    .background(Color.black)
                    .font(.caption)
                    .foregroundColor(.white)
                    .offset(x: -5, y: -5)
            }
            Text(item.description)
            .padding()
            Button("Order This") {
                self.order.add(item: self.item)
            }.font(.headline)
            Spacer()
        }
        .navigationBarTitle(Text(item.name), displayMode: .inline)
    }
}

struct ItemDetail_Previews: PreviewProvider {
    static let order = Order()
    static var previews: some View {
        NavigationView {
            ItemDetail(item: MenuItem.example)
        }
    }
}
