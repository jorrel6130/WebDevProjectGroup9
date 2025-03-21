//
//  ItemsListView.swift
//  PrototypeScreens
//
//  Created by Jorrel Tigbayan on 2025-03-20.
//

import SwiftUI

struct ItemsListView: View {
    
    @Binding var currentCategory: Category
    
    var body: some View {
        NavigationLink (destination: AddItemView()) {
            Text("Add Item")
        }
    }
}

struct ItemsListView_Previews: PreviewProvider {
    static var previews: some View {
        ItemsListView(currentCategory: <#Binding<Category>#>)
    }
}
