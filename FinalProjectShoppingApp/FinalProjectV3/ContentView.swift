// Copy V2
//  ContentView.swift
//  FinalProjectV3
//
//  Created by Alexander Perez on 2023/12/20.
//

import SwiftUI

struct ContentView: View {
    
    @State var currentCart = UserCart()
    @State var selectedVendor: String = "All"
    var body: some View {
        TabView{
            NavigationView{
                //Display the main homepage of the application.
                VStack {
                    ViewHomePage(selectedVendor: $selectedVendor, currentCart: $currentCart)
                }//VStack close
                .navigationTitle("Online Mall")
            }//NavigationStack close
            .tabItem {
                Label("Home", systemImage: "house")
            }
            NavigationView {
                    VStack {
                        CartView(currentCart: $currentCart)
                    }
            }
            .tabItem {
                Label("Cart", systemImage: "cart")
            }
            /*NavigationView{
                UserSettingsView()
                    
            }
                
            .tabItem {
                Label("Settings", systemImage: "gear")
           }*/
            
        }//TabView close
        .tint(.black)
    }
}

#Preview {
    ContentView()
}
