//
//  ContentView.swift
//  PrototypeScreens
//
//  Created by Jorrel Tigbayan on 2025-03-20.
//

import SwiftUI

struct ContentView: View {
    
    @State private var path = NavigationPath()
    
    var body: some View {
        //        NavigationView {
        //            NavigationLink (destination: ItemsListView()) {
        //                Text("Items List")
        //            }
        //        }
        NavigationStack(path: $path) {
            List {
                Section("Categories") {
                    ForEach(Category.categories) { category in
                        NavigationLink(value: category) {
                            VStack {
                                Text(category.name)
                            }
                        }
                    }
                }
            }
            .navigationDestination(for: Category.self) { category in
                List {
                    ForEach(category.items, id: \.name) {
                        item in HStack {
                            Text(item.name)
                            Text(String(format:"x", item.quantity))
                            Text(String(format:"($",(item.price * Float(item.quantity)),")"))
                        }
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
