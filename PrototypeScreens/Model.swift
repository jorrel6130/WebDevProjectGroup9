import Foundation

struct Item: Identifiable, Hashable {
    let id = UUID()
    
    let name: String
    let price: Float
    let quantity: Int
}

struct Category: Identifiable, Hashable {
    let id = UUID()
    
    let name: String
    let items: [Item]
}

extension Category {
    static let categories: [Category] = [
        .init(name: "Food", items: [
            .init(name: "Milk", price: 2.00, quantity: 1),
            .init(name: "Eggs", price: 2.00, quantity: 3),
            .init(name: "Bacon", price: 2.00, quantity: 2),
            .init(name: "Pasta", price: 3.00, quantity: 1),
            .init(name: "Bread", price: 2.00, quantity: 4)
        ]),
        .init(name: "Medication", items: [.init(name: "Medication Stuff", price: 10.00, quantity: 1)]),
        .init(name: "Cleaning Products", items: [.init(name: "Cleaning Stuff", price: 4.30, quantity: 1)]),
        .init(name: "Misc", items: [.init(name: "Misc Stuff", price: 8.30, quantity: 1)])
    ]
}
