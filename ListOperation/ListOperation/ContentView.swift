//
//  ContentView.swift
//  ListOperation
//
//  Created by Alexander Perez on 2023/11/1.
//

import SwiftUI

struct ContentView: View {
    
    @State var items : [String] = (0...9).map {"Item \($0)"}
    @State var showConfirm = false
    @State var deletedSet = IndexSet()
    
    var body: some View {
        List{
            ForEach(items, id:\.self) { item in
                Text(item)
            }
            .onDelete{ indexSet in
                //items.remove(atOffsets: indexSet)
                showConfirm = true
                deletedSet = indexSet

            }
            .actionSheet(isPresented: $showConfirm {
                ActionSheet(
                    title: Text("Delete?"),
                    message: nil,
                    buttons: [
                        .default(Text("Confirm")){
                            items.remove(atOffsets: deletedSet)
                        },
                        .cancel()
                        
                    ]
                    
                
                
                
                )
                
            })
        }
    }
}

#Preview {
    ContentView()
}
