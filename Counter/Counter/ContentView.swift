//
//  ContentView.swift
//  Counter
//
//  Created by Alexander Perez.
//

import SwiftUI

class counterViewModel : ObservableObject {
    @Published var counter : Int = 0
    func increment(){
        counter += 1
    }
    func decrement(){
        counter -= 1
    }
    func resetCount(){
        counter = 0
    }
    
}

struct ContentView: View {
    
    //create an instance of the class
    @StateObject var mainCounter = counterViewModel()
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.blue, .white], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea(.all)
            ButtonView(countModel: mainCounter)
        }
    }
}

#Preview {
    ContentView()
}

struct ButtonView : View {
    @ObservedObject var countModel : counterViewModel
    var body: some View {
            VStack{
                Text("\(countModel.counter)")
                    .font(.system(size: 40))
                    .frame(width: 100, height: 120)
                    .background(.white)
                    .cornerRadius(30)
                HStack{
                    //increment
                    Button{
                        countModel.increment()
                    } label: {
                        buttonDesign(buttonText: "Increment", buttonColor: .green)
                    }
                    //decrement
                    Button{
                        countModel.decrement()
                    } label: {
                        buttonDesign(buttonText: "Decrement", buttonColor: .yellow)
                    }
                    //reset
                    Button{
                        countModel.resetCount()
                        
                    } label: {
                        buttonDesign(buttonText: "Reset", buttonColor: .red)
                    }
                }
            }
    }
}

struct buttonDesign : View {
    var buttonText : String
    var buttonColor : Color
    var body: some View {
        Text(buttonText)
            .foregroundColor(.black)
            .frame(width: 100, height: 40)
            .background(buttonColor)
            .cornerRadius(20)
    }
}

