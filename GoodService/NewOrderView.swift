//
//  NewOrderView.swift
//  GoodService
//
//  Created by Геннадий Ведерников on 20.11.2022.
//

import SwiftUI

struct NewOrderView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @State private var currentDate = Date()
    @State private var newClientName = "Name"
    @State private var newClientSurname = "Surname"
    @State private var newClientPhone = "+7-777-777-77-77"
    
    
    var body: some View {
        
        VStack {
            TextField("Place", text: $newClientName)
            TextField("Surname", text: $newClientSurname)
            TextField("Phone", text: $newClientPhone)
            DatePicker(
                "Start Date",
                selection: $currentDate,
                displayedComponents: [.date]
            )
            .datePickerStyle(.wheel)
            
            Button("Add Task", action: addTask)
                .buttonStyle(.borderedProminent)
            
        }
        .padding()
        
    }
    
    private func addTask() {
        withAnimation {
            let newItem = Task(context: viewContext)
            newItem.timestamp = currentDate
            newItem.client?.name = newClientName
            newItem.client?.surname = newClientSurname
            newItem.client?.phone = newClientPhone

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
    
}

struct NewOrderView_Previews: PreviewProvider {
    static var previews: some View {
        NewOrderView()
    }
}
