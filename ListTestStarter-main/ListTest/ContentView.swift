//
//  ContentView.swift
//  ListTest
//
//  Created by 羅壽之 on 2023/1/16.
//

import SwiftUI

struct ContentView: View {
    
    let restaurantNames = ["Cafe Deadend", "Homei", "Teakha", "Cafe Loisl", "Petite Oyster", "For Kee Restaurant", "Po's Atelier", "Bourke Street Bakery", "Haigh's Chocolate", "Palomino Espresso", "Upstate", "Traif", "Graham Avenue Meats And Deli", "Waffle & Wolf", "Five Leaves", "Cafe Lore", "Confessional", "Barrafina", "Donostia", "Royal Oak", "CASK Pub and Kitchen"]
    
    let restaurantImages = ["cafedeadend", "homei", "teakha", "cafeloisl", "petiteoyster", "forkeerestaurant", "posatelier", "bourkestreetbakery", "haighschocolate", "palominoespresso", "upstate", "traif", "grahamavenuemeats", "wafflewolf", "fiveleaves", "cafelore", "confessional", "barrafina", "donostia", "royaloak", "caskpubkitchen"]
    
    var body: some View {
        
        @State var searchText = ""
        
        NavigationView {
            VStack {
                TextField("Searching", text: $searchText)
                
                List{
                    ForEach(restaurantNames.indices.filter {
                        searchText.isEmpty ? true :
                        restaurantNames
                        [$0].localizedCaseInsensitiveContains(searchText)
                        
                    } , id: \.self){ index in
                        HStack{
                            Image(restaurantImages[index])
                                .resizable()
                                .frame(width: 40, height: 40)
                                .cornerRadius(5)
                            Text(restaurantNames[index])
                            
                            
                        }
                    }
                }
                .navigationTitle("Restaurant List")
            }
        } //navigationView
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
