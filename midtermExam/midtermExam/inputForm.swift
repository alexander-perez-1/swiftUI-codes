//
//  inputForm.swift
//  midtermExam
//
//  Created by Alexander Perez on 2023/11/8.
//

import SwiftUI

struct inputForm: View {
    
    let educations = ["Bachelor's Degree", "Master's Degree", "Doctoral Degree"]
    @State var selectedIndex = 0
    @State var username = ""
    @State var age : Int?
    @State var hasSubmit = false
    @State var isShowingAlert = false
    
    var body: some View {
        NavigationView{
            Form{
                Section(header: Text("NAME")){
                    TextField("Insert your name", text: $username)
                        .font(.headline)
                }
                
                Section(header: Text("AGE")){
                    TextField("Insert your age", value: $age, format: .number)
                        .keyboardType(.numberPad)

                }
                Section(header: Text("EDUCATION")){
                    Picker("Degree", selection: $selectedIndex){
                        ForEach(educations.indices, id:\.self){ index in
                            Text(educations[index])
                        }
                    }
                }
            }
            .navigationTitle("My ID: 410921323")
        }
        VStack{
            Button{
                isShowingAlert = true
            }label: {
                Label("Show Data", systemImage: "magnifyingglass")
                    .frame(width: 180, height: 60)
                    .font(.system(size: 20, weight: .medium))
                    .foregroundColor(.white)
                    .background(.blue)
                    .cornerRadius(30)
            }
        }
        .alert(isPresented: $isShowingAlert, content: {
            Alert( title: Text("Your data are:"),
                   message: Text("\(username), with a \(educations[selectedIndex]) at the age of \(age ?? 0)"),
                   dismissButton: .default(Text("OK"))
            )
        })
    }
}

#Preview {
    inputForm()
}
