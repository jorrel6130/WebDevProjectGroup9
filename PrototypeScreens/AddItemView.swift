//
//  AddItemView.swift
//  PrototypeScreens
//
//  Created by Jorrel Tigbayan on 2025-03-20.
//

import SwiftUI

struct AddItemView: View {
    @State private var name: String = ""
    @State private var price: String = ""
    @State private var amount: Int = 1

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("New Item")
                    .font(.title)
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading)
                
                VStack(alignment: .leading, spacing: 5) {
                    Text("Name")
                        .font(.headline)
                        .bold()
                        .padding(.leading)
                    TextField("Enter name", text: $name)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                VStack(alignment: .leading, spacing: 5) {
                    Text("Price")
                        .font(.headline)
                        .bold()
                        .padding(.leading)
                    TextField("Enter price", text: $price)
                        .keyboardType(.decimalPad)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                VStack {
                    Text("Amount")
                        .font(.headline)
                        .bold()
                    HStack {
                        Button(action: {
                            if amount > 1 {
                                amount -= 1
                            }
                        }) {
                            Image(systemName: "minus.circle.fill")
                                .font(.title)
                                .foregroundColor(.black)
                        }
                        
                        Text("\(amount)")
                            .font(.title)
                            .frame(width: 70, height: 50)
                            .background(Color.white)
                            .cornerRadius(8)
                            .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 1))
                        
                        Button(action: {
                            amount += 1
                        }) {
                            Image(systemName: "plus.circle.fill")
                                .font(.title)
                                .foregroundColor(.black)
                        }
                    }
                }
                
                Button(action: {}) {
                    Text("Save")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.gray.opacity(0.5))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding(.horizontal)
                }
                .disabled(true)
                
                VStack(alignment: .leading, spacing: 5) {
                    Text("Cost Before Taxes: $0.00")
                    Text("Cost After Taxes: $0.00")
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
                .padding(.horizontal)
                
                Spacer()
            }
            .padding(.top)
            .background(Color(UIColor.systemGray6))
            .navigationBarTitle("New Item", displayMode: .inline)
        }
    }
}

struct AddItemView_Previews: PreviewProvider {
    static var previews: some View {
        AddItemView()
    }
}


