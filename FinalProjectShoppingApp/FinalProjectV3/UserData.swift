//
//  UserData.swift
//  FinalProjectV3
//
//  Created by Alexander Perez on 2023/12/20.
//

import Foundation

struct User {
    var firstName : String = ""
    var lastName : String = ""
    var contactNumber : String = ""
    var creditCard : String = ""
    var address : String = ""
    var pastPurchases : [UserCart] = []
    
    init(firstName: String, lastName: String, contactNumber: String, creditCard: String, address: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.contactNumber = contactNumber
        self.creditCard = creditCard
        self.address = address
    }
    mutating func addCart(cart: UserCart) {
            pastPurchases.append(cart)
        }
    mutating func updateAddress(newAdress : String){
        self.address = newAdress
    }
    mutating func updatePhone(newPhone : String){
        self.contactNumber = newPhone
    }
    mutating func updateCard(newCard : String){
        self.creditCard = newCard
    }
    
}

var firstUser = User(firstName: "Alexander", lastName: "Perez", contactNumber: "0905910365", creditCard: "33442244", address: "Zhixue")
