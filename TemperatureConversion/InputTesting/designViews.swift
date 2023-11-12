//
//  designViews.swift
//  InputTesting
//
//  Created by Alexander Perez on 2023/11/7.
//

import Foundation
import SwiftUI

struct BackgroundView : View {
    var body: some View {
        LinearGradient(colors: [.black, Color("MyColor")], startPoint: .top, endPoint: .bottom)
            .ignoresSafeArea(.all)
    }
}
struct BackgroundViewTwo : View {
    var body: some View {
        Image("wallpaper1")
            .resizable()
            .ignoresSafeArea(.all)
            .opacity(0.7)
    }
}

struct TopBar : View {
    var body: some View {
        VStack{
            HStack{
                Text("Temperature Converter")
                    .font(.system(size: 33, weight: .semibold, design: .serif))
                    .foregroundColor(.yellow)
                    //.frame(width: 390, height: 50)
            }
            Text("Enter the temperature value to convert")
                .font(.system(size: 19, weight: .regular, design: .rounded))
                .frame(width: 350, height: 50)
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
        }
    }
}


struct DisplayButton : View {
    
     var buttonText : String
     var buttonImage : String?
     var buttonBackground : Color
     var buttonForeground : Color
     var action: () -> Void
    
    var body: some View {
        Button{
            action()
            
        } label: {
            if let image = buttonImage {
                Label(buttonText, systemImage: image)
                    .frame(width: 60, height: 60)
                    .background(buttonBackground)
                    .foregroundStyle(buttonForeground)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
            } else {
                Text(buttonText)
                    .frame(width: 60, height: 60)
                    .background(buttonBackground)
                    .foregroundStyle(buttonForeground)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
            }
        }
    }
}

struct DisplayButton2 : View {
    
     //var buttonText : String?
     var buttonImage : String
     var buttonBackground : Color
     var buttonForeground : Color
     var action: () -> Void
    
    var body: some View {
        Button{
            action()
            
        } label: {
                Image(systemName: buttonImage)
                    .scaleEffect(1.6)
                    .frame(width: 60, height: 60)
                    .background(buttonBackground)
                    .foregroundStyle(buttonForeground)
                    .clipShape(RoundedRectangle(cornerRadius: 30))
        }
    }
}

struct DisplayButton3 : View {
    
     var buttonText : String
     var buttonImage : String?
     var buttonBackground : Color
     var buttonForeground : Color
     var action: () -> Void
    
    var body: some View {
        Button{
            action()
            
        } label: {
            if let image = buttonImage {
                Label(buttonText, systemImage: image)
                    .frame(width: 60, height: 35)
                    .background(buttonBackground)
                    .foregroundStyle(buttonForeground)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
            } else {
                Text(buttonText)
                    .frame(width: 60, height: 35)
                    .background(buttonBackground)
                    .foregroundStyle(buttonForeground)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
            }
        }
    }
}
