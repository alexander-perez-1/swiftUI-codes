
//
//  CartData.swift
//  FinalProjectV3
//
//  Created by Alexander Perez on 2023/12/20.
//

import Foundation

struct UserCart {
    
    var contents : [Item] = []
    var total : Int = 0
    
    init(contents: [Item] = []) {
        self.contents = contents
        self.total = 0
    }
    
    mutating func addItem (item : Item){
        contents.append(item)
        total += item.price[0]
    }
    mutating func removeItem(item: Item) {
            if let index = contents.firstIndex(where: { $0.id == item.id }) {
                contents.remove(at: index)
                total -= item.price[0]
            }
    }
    mutating func resetItems(){
        contents = []
        total = 0
    }
}
