//
//  UserSettings.swift
//  FinalProjectV3
//
//  Created by Alexander Perez on 2023/12/27.
//

import Foundation
import SwiftUI

struct UserSettingsView: View {
    //@EnvironmentObject var firstUser : User

    var body: some View {
        VStack {
            Text("Welcome \(firstUser.firstName)")
                .font(.system(size: 30, weight: .bold))
            Text("The following are the data that you inserted:")
                .font(.system(size: 20, weight: .regular))
            Text("Current Address: \(firstUser.address)")
            Text("Phone Number: \(firstUser.contactNumber)")
            Text("Credit Card: \(firstUser.creditCard)")
            Text("Past Purchases: ")
            Spacer()
            /*
             NavigationLink(destination: UpdateAddressView()) {
             Text("Update Address")
             .foregroundColor(.blue)
             }
             .padding(.bottom, 8)
             NavigationLink(destination: UpdatePhoneNumberView()) {
             Text("Update Phone Number")
             .foregroundColor(.blue)
             }
             .padding(.bottom, 8)
             NavigationLink(destination: UpdateCreditCardView()) {
             Text("Update Credit Card")
             .foregroundColor(.blue)
             }
             .padding(.bottom, 8)
             }
             .padding()
             */
                .navigationBarTitle("User Settings")
        }
    }
        
}
/*
struct UpdateAddressView: View {
    @EnvironmentObject var firstUser : User
    @State private var newAddress = ""
    
    var body: some View {
        VStack {
            TextField("New Address", text: $newAddress)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button("Update Address") {
                firstUser.updateAddress(newAdress: newAddress)
            }
            .padding()
            .foregroundColor(.white)
            .background(Color.blue)
            .cornerRadius(10)
        }
        .navigationBarTitle("Update Address")
    }
}

struct UpdatePhoneNumberView: View {
    //@EnvironmentObject var firstUser : User

    @State private var newPhoneNumber = ""
    
    var body: some View {
        VStack {
            TextField("New Phone Number", text: $newPhoneNumber)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button("Update Phone Number") {
                firstUser.updatePhone(newPhone: newPhoneNumber)
            }
            .padding()
            .foregroundColor(.white)
            .background(Color.blue)
            .cornerRadius(10)
        }
        .navigationBarTitle("Update Phone Number")
    }
}

struct UpdateCreditCardView: View {
    //@EnvironmentObject var firstUser : User

    @State private var newCreditCard = ""
    
    var body: some View {
        VStack {
            TextField("New Credit Card", text: $newCreditCard)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button("Update Credit Card") {
                firstUser.updateCard(newCard: newCreditCard)
                print("Updated")
            }
            .padding()
            .foregroundColor(.white)
            .background(Color.blue)
            .cornerRadius(10)
        }
        .navigationBarTitle("Update Credit Card")
    }
}
*/
