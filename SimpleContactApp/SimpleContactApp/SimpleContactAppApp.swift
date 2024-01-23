//
//  SimpleContactAppApp.swift
//  SimpleContactApp
//
//  Created by Alexander Perez on 2023/12/6.
//

import SwiftUI

@main
struct SimpleContactAppApp: App {
    let persistenceController = PersistenceController.shared
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.viewContext)
        }
    }
}
