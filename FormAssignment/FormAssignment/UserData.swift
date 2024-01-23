//
//  UserData.swift
//  FormAssignment
//
//  Created by Alexander Perez on 2023/11/13.
//

import Foundation

struct Person  {
    
    var countries = ["United States", "Canada", "United Kingdom", "Germany", "France", "Japan", "Australia", "India", "China", "Taiwan"]
    var chosenTitle : Int = 3
    var personTitle : [String] = ["Mr.", "Mrs.", "Miss", "Not Specified"]
    var firstName : String = ""
    var midName : String = ""
    var lastName : String = ""
    var initials : String = ""
    var chosenGender : Int = 3
    var personGender : [String] = ["Male", "Female", "Prefer not to say", "Not Specified"]
    var birthDate : Date = Date()
    var userAddress : [String] = ["","","",""]
    var chosenCountry : Int = 0
    var country : String = ""
    var homeNumber : String = ""
    var mobileNumber : String = ""
    var email : String = ""
}
