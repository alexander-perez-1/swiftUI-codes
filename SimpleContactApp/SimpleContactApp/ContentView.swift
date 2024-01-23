//
//  ContentView.swift
//  SimpleContactApp
//
//  Created by Alexander Perez on 2023/12/6.
//

import SwiftUI

struct ContentView: View {
    @FetchRequest(sortDescriptors: [
        NSSortDescriptor(key: "name", ascending: true)
    ], animation: .default)
    
    private var contacts: FetchedResults<Contact>
    
    private func deleteContact(at offsets: IndexSet){
        guard let index = offsets.first else {return}
        PersistenceController.shared.deleteData(target: contacts[index])
    }
    
    
    @State var showAddView = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(contacts) { contact in
                    HStack{
                        Text(contact.name ?? "_")
                        Spacer()
                        Text(contact.phone ?? "_")
                    }
                }
                .onDelete { indexSet in
                    deleteContact(at: indexSet)
                    
                }
            }
            
            .navigationTitle("Contact List")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button{
                        showAddView.toggle()
                    } label: {
                        Image(systemName: "plus")
                            .font(.headline)
                    }
                }
            }
            .sheet(isPresented: $showAddView) {
                AddContactView()
            }
        }
        
    }
}

struct AddContactView: View {
    @State var name: String = ""
    @State var phone: String = ""
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            VStack{
                TextField("Input Name", text: $name)
                TextField("Input Phone Number", text: $phone)
                Spacer()
            }
            .navigationTitle("New Contact")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading){
                    Button{
                        presentationMode.wrappedValue.dismiss()
                    }label: {
                        Image(systemName: "xmark")
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing){
                    Button{
                        //addNewContact()
                        PersistenceController.shared.addData(name: name, phone: phone)
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "checkmark")
                            .font(.headline)
                    }
                    .disabled(isDisable)
                }
            }
        }
    }
    
    private var isDisable: Bool {   //computed property
        name.isEmpty || phone.isEmpty
    }
    
}

#Preview {
    ContentView()
        .environment(\.managedObjectContext, PersistenceController.shared.viewContext)
}
