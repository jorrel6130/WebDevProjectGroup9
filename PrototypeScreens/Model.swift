//
//  Model.swift
//  PrototypeScreens
//
//  Created by Jorrel Tigbayan on 2025-03-20.
//

import Foundation

struct Category: Identifiable, Hashable {
    let id = UUID()
    
    let name: String
}

struct Item: Identifiable, Hashable {
    let id = UUID()
    
    let name: String
    let price: Float
    let quantity: Int
    let category: String
}

extension Category {
    static let categories: [Category] = [
        .init(name: "Food"),
        .init(name: "Medication"),
        .init(name: "Cleaning Products"),
        .init(name: "Misc")
    ]
}

extension Item {
    static let items: [Item] = [
        .init(name: "Milk", price: 2.00, quantity: 1, category: "Food"),
        .init(name: "Eggs", price: 2.00, quantity: 3, category: "Food"),
        .init(name: "Bacon", price: 2.00, quantity: 2, category: "Food"),
        .init(name: "Pasta", price: 3.00, quantity: 1, category: "Food"),
        .init(name: "Bread", price: 2.00, quantity: 4, category: "Food")
    ]
}
