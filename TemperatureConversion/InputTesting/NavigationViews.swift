//
//  NavigationViews.swift
//  InputTesting
//
//  Created by Alexander Perez on 2023/11/11.
//

import Foundation
import SwiftUI


struct ViewDescription : View {
    var body: some View {
        ZStack{
            BackgroundView()
            VStack {
                Text ("The formula for converting between the different temperature units are as follows:")
                    .foregroundStyle(.white)
                    .font(.system(size: 20, weight: .light))
                    .padding()
                Text("Fahrenheit = ((°C) * 9/5) + 32")
                    .foregroundStyle(.white)
                    .font(.system(size: 20, weight: .light))
                Text("Celsius = ((°F) - 32) / 1.8")
                    .foregroundStyle(.white)
                    .font(.system(size: 20, weight: .light))
                Spacer()
                
            }
        }
    }
}
struct ViewAbout : View {
    var body: some View {
        ZStack {
            BackgroundView()
            VStack {
                Text ("Developed by: Alexander Perez")
                    .foregroundStyle(.white)
                    .font(.system(size: 20, weight: .light))
                Text("Student ID: 410921323")
                    .foregroundStyle(.white)
                    .font(.system(size: 20, weight: .light))
            }
            //.multilineTextAlignment(.center)
        }
    }
}
