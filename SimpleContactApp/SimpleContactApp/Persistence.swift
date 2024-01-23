//
//  Persistence.swift
//  SimpleContactApp
//
//  Created by Alexander Perez on 2023/12/6.
//

import Foundation
import CoreData

struct PersistenceController {
    
    static let shared = PersistenceController()
    let container: NSPersistentContainer
    var viewContext: NSManagedObjectContext {
        container.viewContext
    }
    
    init() {
        container = NSPersistentContainer(name: "ContactsModel")
        container.loadPersistentStores{ ( storeDescription, error) in
            if let error = error {print(error)}
        }
    }
        
    func saveData() {
            // checking any data changes
            guard viewContext.hasChanges else {
                return
            }
            do{
                try viewContext.save()
            } catch {
                print(error)
            }
        }
        func addData(name: String, phone: String) {
            //create a new managed object
            let newContact = Contact(context: viewContext)
            newContact.name = name
            newContact.phone = phone
            saveData()
            
        }
        func deleteData(target: NSManagedObject) {
            viewContext.delete(target)
            saveData()
        }
}

