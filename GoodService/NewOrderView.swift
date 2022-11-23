//
//  NewOrderView.swift
//  GoodService
//
//  Created by Геннадий Ведерников on 20.11.2022.
//

import SwiftUI

struct NewOrderView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @Binding var orderIsPresented: Bool
    
    @State private var newClientName = ""
    @State private var newClientSurname = ""
    @State private var newClientPhone = ""
    
    @State private var brand = ""
    @State private var model = ""
    @State private var problem = "Enter problem"
    @State private var serialNumber = ""
    @State private var currentDate = Date()
    
    var body: some View {
        
        VStack {
            
            Form {
            ClientView(
                newClientName: $newClientName,
                newClientSurname: $newClientSurname,
                newClientPhone: $newClientPhone
            )
                
                Label("Оборудование:", systemImage: "tv.and.hifispeaker.fill")
                
                TextField(text: $brand, prompt: Text("Enter brand")) {
                    Text("Brand")
                }
                
                TextField(text: $model, prompt: Text("Enter model")) {
                    Text("Model")
                }
                TextEditor(text: $problem)
                
                TextField(text: $serialNumber, prompt: Text("Enter serial number")) {
                    Text("Serial number")
                }
                
                
                
                DatePicker(
                    "Start Date",
                    selection: $currentDate,
                    displayedComponents: [.date]
                )
                .datePickerStyle(.wheel)
            }
                
                
                
                Button("Add Task", action: addTask)
                    .buttonStyle(.borderedProminent)
            }
        
    }
    
    private func addTask() {
        withAnimation {
            let newItem = Task(context: viewContext)
            let newClient = Client(context: viewContext)
            
            newItem.id = UUID()
            idNumber += 1
            newItem.id2 = Int64(idNumber)
            newItem.brand = brand
            newItem.diagnosticBool = false
            newItem.model = model
            newItem.problem = problem
            newItem.serialNumber = serialNumber
            newItem.status = StatusTask.new.rawValue
            newItem.timestamp = currentDate
            
            newClient.name = newClientName
            newClient.surname = newClientSurname
            newClient.phone = newClientPhone
            
            newItem.client = newClient

            do {
                try viewContext.save()
                orderIsPresented = false
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
        NewOrderView(orderIsPresented: .constant(true))
    }
}
