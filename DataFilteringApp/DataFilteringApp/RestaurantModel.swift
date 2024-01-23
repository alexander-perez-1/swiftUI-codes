//
//  RestaurantModel.swift
//  DataFilteringApp
//
//  Created by Alexander Perez on 2023/12/10.
//

import Foundation

struct Dish: Identifiable, Hashable {
    var id = UUID()
    var name: String = ""
    var type: String = ""
    var price: Int = 0
    var image: String = ""
}
