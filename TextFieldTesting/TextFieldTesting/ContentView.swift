//
//  ContentView.swift
//  TextFieldTesting
//
//  Created by Alexander Perez on 2023/11/18.
//

import SwiftUI

struct ContentView: View {
    
    @State var myName : String = ""
    var body: some View {
        VStack {
            TextField("Insert Value", text: $myName)
                .keyboardType(.default)
        }
       // .padding()
    }
}

#Preview {
    ContentView()
}
