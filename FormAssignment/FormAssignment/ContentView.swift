//
//  ContentView.swift
//  FormAssignment
//
//  Created by Alexander Perez on 2023/11/13.
//

import SwiftUI

struct ContentView: View {
    @State var someone = Person()
    @State var isShowing = false
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    FormView(someone: $someone)
                        .background(Color("myColor"))
                    Button{
                        isShowing = true
                    } label: {
                        Label("SEND", systemImage: "paperplane.fill")
                            .frame(width: 100, height: 40)
                            .font(.system(size: 15, weight: .medium))
                            .foregroundColor(.white)
                            .background(.brown)
                            .cornerRadius(30)
                    }
                    .sheet(isPresented: $isShowing) {
                        PersonView(someone: $someone, isShowing: $isShowing)
                            .presentationDragIndicator(.visible)
                    }
                    
                }
            }
            .navigationTitle("Personal input form")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
    


#Preview {
    ContentView()
}


struct FormView : View {
    @Binding var someone : Person
    var body: some View {
        Form{
            Section{
                HStack{
                    Picker(selection: $someone.chosenTitle, label: Text("Title:")){
                        Text("Mr.").tag(0)
                        Text("Mrs.").tag(1)
                        Text("Miss").tag(2)
                    }
                    .frame(width: 110)
                    TextField("First", text: $someone.firstName)
                        .frame(width: 130)
                        .multilineTextAlignment(.center)
                        .textFieldStyle(.roundedBorder)
                    
                    TextField("Initials", text: $someone.initials)
                        .frame(width: 80)
                        .multilineTextAlignment(.center)
                        .textFieldStyle(.roundedBorder)
                }
                HStack {
                    TextField("Middle", text: $someone.midName)
                        .multilineTextAlignment(.center)
                        .textFieldStyle(.roundedBorder)
                    TextField("Last", text: $someone.lastName)
                        .multilineTextAlignment(.center)
                        .textFieldStyle(.roundedBorder)
                }
            } header: {
                Text("Name")
            }
            Section{
                Picker(selection: $someone.chosenGender, label: Text("Select your Gender")){
                    Text("Male").tag(0)
                    Text("Female").tag(1)
                    Text("Prefer not to say").tag(2)                    
                }
                
            } header: {
                Text("Gender")
            }
            Section{
                DatePicker("Enter your D.O.B", selection: $someone.birthDate, displayedComponents: .date)
            } header: {
                Text("Date of Birth")
            }
            Section{
                HStack{
                    TextField("Current Address", text: $someone.userAddress[0])
                        .textFieldStyle(.roundedBorder)
                }
                TextField("City", text: $someone.userAddress[1])
                    .textFieldStyle(.roundedBorder)
                CountryPicker(someone: $someone)
                
                HStack{
                    TextField("Postal Code", text: $someone.userAddress[2])
                        .textFieldStyle(.roundedBorder)
                        .keyboardType(.decimalPad)
                    TextField("Region", text: $someone.userAddress[3])
                        .textFieldStyle(.roundedBorder)
                        .keyboardType(.decimalPad)
                }
            } header: {
                Text("Address")
            }
            Section{
                TextField("Mobile Phone Number", text: $someone.mobileNumber)
                    .textFieldStyle(.roundedBorder)
                    .keyboardType(.decimalPad)
                TextField("Home Phone Number", text: $someone.homeNumber)
                    .textFieldStyle(.roundedBorder)
                    .keyboardType(.decimalPad)
            } header: {
                Text("Phone Number")
            }
            Section{
                TextField("Current Email", text: $someone.email)
                    .textFieldStyle(.roundedBorder)
            } header: {
                Text("Email")
            }
        }
        .scrollContentBackground(.hidden)
    }
}


struct PersonView : View {
    @Binding var someone : Person
    @Binding var isShowing : Bool
    var body: some View {
        NavigationView {
            List{
                let _ = print(someone.chosenGender)
                let _ = print(someone.chosenCountry)
                let _ = print(someone.chosenTitle)
                Text("This is the data in the form:")
                    .font(.system(size: 23, weight: .regular))
                    .underline()
                Text("Title: \(someone.personTitle[someone.chosenTitle])")
                Text("First Name: \(someone.firstName)")
                Text("Middle Name: \(someone.midName)")
                Text("Last Name: \(someone.lastName)")
                Text("Initials: \(someone.initials)")
                Text("Date of Birth: \(formattedDate(someone.birthDate))")
                Text("Gender: \(someone.personGender[someone.chosenGender])")
                Text("Country: \(someone.countries[someone.chosenCountry])")
                Text("Current Address: \(someone.userAddress[0])")
                Text("City: \(someone.userAddress[1])")
                Text("Postal Code: \(someone.userAddress[2])")
                Text("Region: \(someone.userAddress[3])")
                Text("Home Phone: \(someone.homeNumber )")
                Text("Cellular Number: \(someone.mobileNumber )")
                Text("Email: \(someone.email )")
            }
            .font(.system(size: 20, weight: .light))
            .padding(15)
            .toolbar{
                ToolbarItem(placement: .topBarLeading){
                    Button("Close"){
                        isShowing = false
                    }
                }
                
            }
        }
    }
    
    private func formattedDate(_ date: Date) -> String {
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .medium
            return dateFormatter.string(from: date)
        }
}
