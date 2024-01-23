//
//  ContentView.swift
//  DataFilteringApp
//
//  Created by Alexander Perez on 2023/12/10.
//

import SwiftUI

struct ContentView: View {
    
    @State var searchText = ""
    @State var selected = "All"
    @State var selectedDish : Dish?
    
    var types = ["All","Burger","Omelette","Pasta","Noodles"]
    
    var foods: [Dish] = [
        Dish(name: "Double Beef and Cheese Burger",
             type: "Burger",
             price: 120,
             image: "hamburger0"
             ),
        Dish(name: "Chicken and Bacon Burger",
             type: "Burger",
             price: 95,
             image: "hamburger1"),
        Dish(name: "Chicken Egg Omelette",
             type: "Omelette",
             price: 50,
             image: "omelette0"),
        Dish(name: "Bacon Omelette",
             type: "Omelette",
             price: 60,
             image: "omelette1"),
        Dish(name: "Italian Spaghetti",
             type: "Pasta",
             price: 150,
             image: "pasta0"),
        Dish(name: "Beef Noodles",
             type: "Noodles",
             price: 70,
             image: "noodles0")
            ]
            
    var body: some View {
        VStack {
            Text("Categories:")
                .font(.system(size: 17, weight: .bold))
            ScrollView(.horizontal){
                LazyHGrid(rows: [GridItem()], content: {
                    ForEach(types, id: \.self){ type in
                        Text(type)
                            .frame(width: 90, height:45)
                            .background(type == selected ? .orange : .black)
                            .foregroundStyle(.white)
                            .font(.system(size: 17, weight: .bold))
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .onTapGesture {
                                selected = type
                            }
                    }
                })
            }
            .frame(height:70)
            
            
            Divider()
            HStack{
                Text("Preview")
                Spacer()
                Text("Name:")
                Spacer()
                Text("Price:")
                //Spacer()
            }
            .font(.system(size: 17, weight: .bold))
            .padding()
            
            if selected == "All" {
                List(foods) { food in
                    HStack {
                        NavigationLink(
                            destination: DishDetail(dish: food),
                            tag: food,
                            selection: $selectedDish,
                            label: {
                                ShowDish(dish: food)
                            }
                        )
                        .onTapGesture {
                            selectedDish = food
                        }
                    }
                }
                .listStyle(.plain)
            } else {
                List(foods.filter { $0.type == selected }) { food in
                    HStack {
                        ShowDish(dish: food)
                    }
                }
                .listStyle(.plain)
            }
        }
        
    }
}

#Preview {
    ContentView()
}

struct DishDetail : View {
    
    let dish : Dish
    var body: some View {
        Text("More Info")
    }
}

struct ShowDish : View {
    
    var dish : Dish
    
    var body: some View {
        HStack{
            Image(dish.image)
                .resizable()
                .frame(width: 60, height: 60)
            Text(dish.name)
            Spacer()
            Text("$ \(dish.price)")
            
        }
    }
}
