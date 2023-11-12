//
//  ContentView.swift
//  midtermExam
//
//  Created by Alexander Perez on 2023/11/8.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            topBar()
            Text("My ID: 410921323")
                .foregroundColor(.blue)
            Spacer()
            Image(systemName: "sun.haze")
                .resizable()
                .frame(width: 100, height: 100)
                .padding()
            bottomBar()
        }
    }
}


#Preview {
    ContentView()
}

struct topBar : View {
    var body: some View {
        HStack{
            Rectangle()
                .foregroundColor(Color.red)
                .frame(width: 60, height: 50)
            Rectangle()
                .foregroundColor(Color.yellow)
                .frame(width: 60, height: 50)
            Rectangle()
                .foregroundColor(Color.green)
                .frame(width: 60, height: 50)
        }
    }
}
struct bottomBar : View {
    var body: some View {
        VStack {
            Rectangle()
                .foregroundColor(.blue)
                .frame(width: .infinity, height: 25)
            Rectangle()
                .foregroundColor(.orange)
                .frame(width: .infinity, height: 25)
        }
    }
}
