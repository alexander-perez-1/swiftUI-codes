//
//  ItemData.swift
//  FinalProjectV3
//
//  Created by Alexander Perez on 2023/12/20.
//

import Foundation

struct Item : Identifiable {
    
    var id = UUID()
    var name : String = ""
    var category : String = ""
    var vendor : String = ""
    var price : [Int] = []
    var image : String = ""
    var quantity : Int = 0
    var variation : [String]?
    var color : [String]?
    
    init(item: Item, price: Int, variation: String, color: String) {
        self.name = item.name
        self.category = item.category
        self.vendor = item.vendor
        self.price = [price]
        self.image = item.image
        self.quantity = item.quantity
        self.variation = [variation]
        self.color = [color]
    }
    
    
    init(name: String, category: String, vendor: String, price: [Int], image: String, quantity: Int, variation: [String]? = nil, color: [String]? = nil) {
        self.name = name
        self.category = category
        self.vendor = vendor
        self.price = price
        self.image = image
        self.quantity = quantity
        self.variation = variation
        self.color = color
    }
    
    func retrievePriceAt(index: Int) -> Int? {
        if index < price.count {
            return price[index]
        } else{
            return nil
        }
    }
    func retreiveVariationAt(index: Int) -> String{
        if let variation = variation, index < variation.count {
                return variation[index]
            } else {
                return "Out of scope"
            }
    }
    
}

var shopItems: [Item] = [
    Item(name: "Sony WF100X", category: "Headphones", vendor: "Sony", price: [6300], image: "sony", quantity: 32, color: ["White", "Black", "Cream"]),
    Item(name: "Audio Technica M50x", category: "Headphones", vendor: "Audio Technica", price: [4600], image: "ath-50", quantity: 34, color: ["White", "Black"]),
    Item(name: "Philip SHP9500", category: "Headphones", vendor: "Philips", price: [2000], image: "phil", quantity: 30),
    Item(name: "10,000 mAh Powerbank", category: "Powerbank", vendor: "Xiaomi", price: [300], image: "powerbank1", quantity: 124),
    Item(name: "Philip Earbuds", category: "Earbuds", vendor: "Philips", price: [450], image: "phil-ear", quantity: 30),
    Item(name: "Macbook Pro 15 inch", category: "Laptop", vendor: "Apple", price: [30000, 50000], image: "macbook1", quantity: 20, variation: ["8 GB RAM, 256 GB SSD", "16GB RAM, 512 GB SSD"]),
    Item(name: "iPad Air 5th Generation", category: "Tablet", vendor: "Apple", price: [24000, 28000], image: "ipadair", quantity: 11, variation: ["64GB", "256 GB"], color: ["Blue", "Grey", "Green", "Purple"]),
    Item(name: "iPhone 15 Pro", category: "Phone", vendor: "Apple", price: [40000, 60000], image: "iphone15", quantity: 300, variation: ["128 GB", "256 GB", "512 GB"], color: ["White", "Black", "Blue"]),
    Item(name: "Google Pixel 8", category: "Phone", vendor: "Google", price: [38000, 36000], image: "pixel8", quantity: 59, variation: ["128 GB", "256 GB"], color: ["Blue", "Black", "White"]),
    Item(name: "Sony 18-55mm Lens", category: "Camera Lens", vendor: "Sony", price: [5000], image: "1855lens", quantity: 40),
    Item(name: "Tamron 50mm Lens", category: "Camera Lens", vendor: "Tamron", price: [20000], image: "tamronLens", quantity: 43)
]

//var vendors : [String] = ["Apple", "Sony", "Audio Technica", "Xiaomi", "Philips", "Google", "Tamron"]
var vendors: [String] {
    var totalVendors = Set(shopItems.map { $0.vendor })
    totalVendors.insert("All")
    return totalVendors.sorted()
}

var totalCategories: [String] {
    var totalCat = Set(shopItems.map { $0.category })
    totalCat.insert("All")
    return totalCat.sorted()
}

