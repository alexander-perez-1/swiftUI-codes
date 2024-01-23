//
//  HomeTabViews.swift
//  FinalProjectV3
//
//  Created by Alexander Perez on 2023/12/20.
//

import Foundation
import SwiftUI

//View the list of the items in the shopItems array
struct ViewHomePage : View {
    @Binding var selectedVendor : String
    @State private var searchText: String = ""
    @Binding var currentCart : UserCart
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    var body: some View {
        //view the vendors scrollbar
        ShowTopScrollView(selectedVendor: $selectedVendor)
            .frame(height:70)
        //view the items based on the vendor that is selected; default is 'All'
        if selectedVendor == "All" {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(shopItems.filter { item in
                        searchText.isEmpty || item.name.localizedStandardContains(searchText)}) { item in
                            NavigationLink(destination: ViewClickedItem(item: item, currentCart: $currentCart)) {
                                ShowIndividualItem(item: item)
                            }
                        }
                }
                .padding()
            }
            .searchable(text: $searchText)
        } else {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(shopItems.filter{$0.vendor == selectedVendor && (searchText.isEmpty || $0.name.localizedStandardContains(searchText))}) { item in
                        NavigationLink(destination: ViewClickedItem(item: item, currentCart: $currentCart)) {
                            ShowIndividualItem(item: item)
                        }
                        
                    }
                }
                .padding()
            }
            .searchable(text: $searchText)
        }//if else close
    }
}

struct ViewClickedItem : View {
    var item : Item
    @State private var showAlert = false
    @State private var showError = false
    @State var selectedVariation : String?
    @State var selectedColor : String?
    @State var correspondingPrice : Int = 0
    @State private var alertMessage: String = ""
    @Binding var currentCart : UserCart
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                Text(item.name)
                    .font(.system(size: 35, weight: .bold))
                Image(item.image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 250, height: 300)
                //display the price depending on the variation that was selected
                Text("$ \(item.price[correspondingPrice])")
                    .font(.system(size: 35, weight: .bold))
                    .foregroundColor(.blue)
                VStack(alignment: .leading) {
                    Text("Select Variation:")
                        .font(.system(size: 30, weight: .regular))
                        HStack {
                            //check if the item has a variation array
                            if let variationCheck = item.variation {
                                ForEach(Array(variationCheck.enumerated()), id: \.element) { index, vari in
                                    Text(vari)
                                        .padding(8)
                                        .background(selectedVariation == vari ? Color.blue : Color.black.opacity(0.2))
                                        .cornerRadius(8)
                                        .onTapGesture {
                                            selectedVariation = vari
                                            correspondingPrice = index
                                        }
                                }
                            } else {
                                Text("Default")
                                    .padding(8)
                                    .background(selectedVariation == "Default" ? Color.blue : Color.black.opacity(0.2))
                                    .cornerRadius(8)
                                    .onTapGesture {
                                        selectedVariation = "Default"
                                    }
                            }//if else close
                        }//Hstack close
                            Text("Select Color:")
                                .font(.system(size: 30, weight: .regular))
                            HStack {
                                if let colorCheck = item.color {
                                    ForEach(colorCheck, id: \.self) { color in
                                        Text(color)
                                            .padding(8)
                                            .background(selectedColor == color ? Color.blue : Color.black.opacity(0.2))
                                            .cornerRadius(8)
                                            .onTapGesture {
                                                selectedColor = color
                                            }
                                    }
                                } else {
                                    Text("Default")
                                        .padding(8)
                                        .background(selectedColor == "Default" ? Color.blue : Color.black.opacity(0.2))
                                        .cornerRadius(8)
                                        .onTapGesture {
                                            selectedColor = "Default"
                                        }
                                }
                            }//Hstack close
                        }
                    
                    Button(action: {
                            addToCart()
                        }
                        ) {
                           Text("Add to Cart")
                               .font(.headline)
                               .foregroundColor(.white)
                               .padding()
                               .background(Color.blue)
                               .cornerRadius(10)
                       }
                        .alert(isPresented: $showAlert) {
                                Alert(
                                    title: Text("Notice"),
                                    message: Text(alertMessage),
                                    dismissButton: .default(Text("Okay")){
                                        showAlert = false
                                    }
                                )
                            }
                        }
            .padding()
        }
        }
    func addToCart() {
        guard let selectedVariation = selectedVariation else {
            alertMessage = "Please select a variation before adding the item to the cart"
            showAlert = true
            return
        }
        
        guard let selectedColor = selectedColor else {
            alertMessage = "Please select a color before adding the item to the cart"
            showAlert = true
            return
        }
        
        alertMessage = "Added item to cart successfully"
        
        let itemPrice = item.price[correspondingPrice]
        
        let cartItem = Item(item: item, price: itemPrice, variation: selectedVariation , color: selectedColor )
        
        currentCart.addItem(item: cartItem)
        alertMessage = "Added \(item.name) with price $\(itemPrice) to cart successfully"
        showAlert = true
    }
}

struct ShowIndividualItem : View {
    
    var item : Item
    
    var body: some View {
        HStack(spacing: 16) {
                   VStack(alignment: .center) {
                       Text(item.name)
                           .font(.system(size: 22, weight: .bold))
                           .multilineTextAlignment(.center)
                       HStack(alignment: .center){
                           Text("$\(item.price[0])")
                                .font(.system(size: 19, weight: .regular))
                               .foregroundColor(.blue)
                       }
                       Image(item.image)
                           .resizable()
                           .scaledToFit()
                           .frame(width: 90, height: 90)
                   }                   
               }
               .padding(.vertical, 12)
    }
}
struct ShowTopScrollView : View {
    @Binding var selectedVendor : String
    var body: some View {
        ScrollView(.horizontal){
            LazyHGrid(rows: [GridItem()], content: {
                ForEach(vendors, id: \.self){ type in
                    Text(type)
                        .frame(width: 80, height:40)
                        .background(type == selectedVendor ? .orange : .black)
                        .foregroundStyle(.white)
                        .font(.system(size: 13, weight: .bold))
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        .onTapGesture {
                            selectedVendor = type
                        }
                }
            })
        }
    }
}

