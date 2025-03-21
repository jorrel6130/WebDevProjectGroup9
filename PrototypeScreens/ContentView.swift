import SwiftUI

struct ContentView: View {
    
    @State private var path = NavigationPath()
    @State private var totalBeforeTax: Float = 0.0
    @State private var totalAfterTax: Float = 0.0
    @State private var taxRate: Float = 0.13
    
    var body: some View {
        NavigationStack(path: $path) {
            HStack {
                Spacer()
                NavigationLink(destination: AddItemView()) {
                    Text("New Item")
                    Image(systemName: "plus.circle.fill")
                        .font(.title)
                        .foregroundColor(.blue)
                }
                .padding(.horizontal)
            }
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
                VStack {
                    List {
                        ForEach(category.items, id: \.name) {
                            item in HStack {
                                Text(item.name)
                                Spacer()
                                Text("x\(item.quantity)")
                                Text(String(format: "$%.2f", item.price * Float(item.quantity)))
                            }
                        }
                    }
                    // Tax calc display
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Cost Before Taxes: \(String(format: "$%.2f", totalBeforeTax))")
                            .font(.subheadline)
                        Text("Cost After Taxes: \(String(format: "$%.2f", totalAfterTax))")
                            .font(.subheadline)
                            .bold()
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                    .padding(.horizontal)
                    .padding(.bottom)
                }
                .onAppear {
                    calculateTotals(for: category)
                }
            }
        }
    }
    
    private func calculateTotals(for category: Category) {
        // calc total before tax
        totalBeforeTax = category.items.reduce(0) { total, item in
            total + (item.price * Float(item.quantity))
        }
        
        // calc total after tax
        totalAfterTax = totalBeforeTax * (1 + taxRate)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
