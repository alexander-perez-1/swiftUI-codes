//
//  ContentView.swift
//  InputTesting
//
//  Created by Alexander Perez on 2023/11/7.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var mainTemp = TemperatureClass()
    
    var body: some View {
        NavigationView {
            ZStack {
                BackgroundView()
                VStack {
                    //Spacer()
                    TopBar()
                    
                    InputText(tempModel: mainTemp)
                    
                    DisplayTemp(tempModel: mainTemp)
                    //Spacer()
                    List{
                        NavigationLink{
                            ViewDescription()
                        } label: {
                            Text("How does it work?")
                        }
                        NavigationLink{
                            ViewAbout()
                        } label: {
                            Text("About us")
                        }
                    }
                    .scrollContentBackground(.hidden)
                
                }
                
                Text("Thank you for using our app.")
                    .foregroundStyle(.white)
                
                //.multilineTextAlignment(.center)
                
            }
            .navigationTitle(
                    Text("")
                        
            )
        }
        
    }
}

#Preview {
    ContentView()
}



struct InputText : View {
    
    @ObservedObject var tempModel : TemperatureClass
    
    var body: some View {
        VStack (spacing: 20){
            VStack {
                HStack {
                    /*TextField("", value: tempModel.isCelsius ? $tempModel.celsiusValue : $tempModel.farenValue, format: .number)*/
                    TextField("", value: $tempModel.insertedValue, format: .number)
                        .keyboardType(.decimalPad)
                        .background(Color("MyColor2"), in: RoundedRectangle(cornerRadius: 5))
                        .font(.system(size: 60, weight: .light))
                        .frame(width: 200, height: 70)
                        .foregroundStyle(.white)
                        .multilineTextAlignment(.center)
                        .onReceive(tempModel.$insertedValue, perform: { _ in
                            tempModel.setValues()
                        })
                    
                    
                        VStack {
                            DisplayButton3(buttonText: "°C",
                                            buttonBackground: tempModel.isCelsius ? .blue : .gray,
                                            buttonForeground: .white,
                                            action: tempModel.toggleCelsius)
                            DisplayButton3(buttonText: "°F",
                                          buttonBackground: tempModel.isCelsius ? .gray : .blue,
                                          buttonForeground: .white,
                                          action: tempModel.toggleFarenheit)
                            }
                        }
                }
                HStack {
                    
                    DisplayButton2(buttonImage: "gobackward",
                                  buttonBackground: .white,
                                  buttonForeground: .red,
                                  action: tempModel.resetTemp)
                    
                    DisplayButton2(buttonImage: "arrowshape.down.fill",
                                   buttonBackground: .blue,
                                   buttonForeground: .white,
                                   action: tempModel.decreaseBy1)
                    DisplayButton2(buttonImage: "arrowshape.up.fill",
                                   buttonBackground: .blue,
                                   buttonForeground: .white,
                                   action: tempModel.increaseBy1)
                    DisplayButton2(buttonImage: "minus.forwardslash.plus",
                                   buttonBackground: .orange,
                                   buttonForeground: .white,
                                   action: tempModel.setInverse)
                }//Hstack
        }//VStack
    }
}

struct DisplayTemp : View {
    
    @ObservedObject var tempModel : TemperatureClass
    
    var body: some View {
        VStack {
            HStack{
                
                if tempModel.isCelsius == true {
                    Text("= \(String(format: "%.1f", tempModel.farenValue)) °F")
                        .font(.system(size: 60, weight: .light))
                        .frame(width: 350, height: 80)
                        .foregroundStyle(.white)
                } else {
                        Text("= \(String(format: "%.1f", tempModel.celsiusValue)) °C")
                            .font(.system(size: 60, weight: .light))
                            .frame(width: 350, height: 80)
                            .foregroundStyle(.white)
                }
            }
        }
    }
}



