//
//  CartTabView.swift
//  FinalProjectV3
//
//  Created by Alexander Perez on 2023/12/20.
//

import Foundation
import SwiftUI

struct CartView: View {
    //@EnvironmentObject var firstUser : User
    @Binding var currentCart: UserCart
    @State private var checkoutConfirm = false
    @State private var checkoutNotify = false
    var body: some View {
        VStack {
            if currentCart.contents.isEmpty {
                Text("Your cart is empty")
            } else {
                ForEach(currentCart.contents, id: \.id) { cartItem in
                    CartItemView(currentCart: $currentCart, cartItem: cartItem)
                }
            }
            Spacer()
            HStack{
                Text("Current Total is: $\(currentCart.total)")
                    .font(.system(size: 18, weight: .bold))
            }
            Button {
                    checkoutNotify = true
            } label : {
                Text("Checkout")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
               }
            .sheet(isPresented: $checkoutNotify) {
                VStack(alignment: .center) {
                    Text("Are you sure you wish to checkout?")
                        .font(.system(size: 30, weight: .bold))
                        .foregroundColor(.red)
                    Text("Total: $\(currentCart.total)")
                        .font(.system(size: 25, weight: .medium))
                    Text("Items will be delivered to \(firstUser.address)")
                        .font(.system(size: 25, weight: .medium))
                    Text("Once you confirm, you will not be able to cancel the order!")
                        .font(.system(size: 25, weight: .medium))
                    Spacer()
                    HStack(spacing: 16) {
                        Button {
                            checkoutNotify = false
                            firstUser.addCart(cart: currentCart)
                            currentCart.resetItems()
                        } label: {
                            Text("Accept")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding()
                                .background(Color.green)
                                .cornerRadius(10)
                        }
                        
                        Button {
                            checkoutNotify = false
                        } label: {
                            Text("Decline")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding()
                                .background(Color.red)
                                .cornerRadius(10)
                        }
                    }
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.white)
                .cornerRadius(16)
                .shadow(radius: 5)
                .presentationDetents([.medium])
                .presentationDragIndicator(.visible)
            }
                
        }
        .navigationTitle("Your Cart")
    }
}

struct CartItemView: View {
    @Binding var currentCart: UserCart
    let cartItem: Item

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(cartItem.name)
                    .font(.headline)
                    .fontWeight(.bold)
                Text("$ \(cartItem.price[0])")
                }
                VStack(alignment: .leading) {
                    Text("Variation: \(cartItem.variation?[0] ?? "Default")")
                    Text("Color: \(cartItem.color?[0] ?? "Default")")
                }
                Button(action: {
                    currentCart.removeItem(item: cartItem)
                }) {
                    Text("Delete")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.red)
                        .cornerRadius(10)
                        .frame(width: 80, height: 40)
                }
            }
            .contentShape(Rectangle()) // Ensure the entire row is tappable
            .onTapGesture {
                // You can add additional behavior when the row is tapped (optional)
            }
    }
}
