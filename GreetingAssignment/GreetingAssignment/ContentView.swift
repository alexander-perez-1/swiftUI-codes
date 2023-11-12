//
//  ContentView.swift
//  GreetingAssignment
//
//  Created by Alexander Perez on 2023/10/18.
//

import SwiftUI

struct ContentView: View {
    @State private var accepted = false
    @State private var showSheet = false
    var body: some View {
            ZStack {
                WallpaperView()
                //Image()
                VStack{
                    HStack{
                        BannerView()
                    }//HStack
                    Spacer()
                    HomeView()
                    Spacer()
                    Button{
                        showSheet.toggle()
                    } label: {
                        DisplayButton(stuffToWrite: "Open Card", backColor: .red,
                                      w: 200, h: 50)
                    }
                    .sheet(isPresented: $showSheet){
                        SheetView(accepted: $accepted)
                            .presentationDetents([.medium])
                            .presentationDragIndicator(.visible)
                            .presentationBackground(accepted ? .white : .gray)
                    }
                    Spacer()
                }
                //VStack
            } //ZStack
    }
}

#Preview {
    ContentView()
}

struct WallpaperView : View {
    var body: some View {
        Image("christmas3")
            .resizable()
            .scaledToFill()
            .ignoresSafeArea(.all)
            .opacity(0.8)
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        }
    }


struct BannerView : View {
    var body: some View {
        Image("tree3")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 90, height: 90)
        Text("Merry Christmas!")
            .font(.custom("Agbalumo", size: 30))
            .foregroundColor(.white)
            .multilineTextAlignment(.center)
        Image("wreath1")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 90, height: 90)
    }
}

struct DisplayButton : View {
    var stuffToWrite : String
    var backColor : Color
    var w : CGFloat
    var h : CGFloat
    var body: some View {
        Text(stuffToWrite)
            .frame(width: w, height: h)
            .background(backColor)
            .foregroundColor(.white)
            .font(.custom("Agbalumo", size: 20))
            .cornerRadius(40)
    }
}

struct HomeView : View {
    var body: some View {
        Text("You have a special invitation")
            .foregroundColor(.black)
            .multilineTextAlignment(.center)
            .font(.custom("Cinzel", size: 22))
            .frame(width: 200, height: 260)
            .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 10, style: .continuous))
        Image("tree4")
            .resizable()
            .aspectRatio(contentMode: .fit)
    }
}

struct SheetView : View {
    @Binding var accepted : Bool
    var body: some View {
        ZStack{
            VStack{
                Image("santa2")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Text("It will soon be that special time of the year where the weather gets cold and the family gathers 'round. You have been invited to join our Christmas party. Come and join us on Christmas Eve for a night of festivities! ")
                    .foregroundColor(accepted ? .black : .white)
                    .multilineTextAlignment(.center)
                    .font(.custom("Cinzel", size: 20))
                    .frame(width: 300, height: 260)
                Text(accepted ? "Status: Accepted" : "Status: Not Accepted" )
                    .foregroundColor(accepted ? .green : .orange)
                    .multilineTextAlignment(.center)
                    .font(.custom("Cinzel", size: 20))
                HStack{
                    Spacer()
                    Button{
                        if(accepted == false) {accepted.toggle()}
                    } label: {
                        DisplayButton(stuffToWrite: "Accept", backColor: .blue,
                                      w: 100, h: 50)
                    }
                    Button{
                        if(accepted == true) {accepted.toggle()}
                    } label: {
                        DisplayButton(stuffToWrite: "Decline", backColor: .red,
                                      w: 100, h: 50)
                    }
                    Spacer()
                }
            }
        }
    }
}


/*

 */
