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
    
    @State private var newClientName = ""
    @State private var newClientSurname = ""
    @State private var newClientPhone = ""
    
    @State private var taskModel = ""
    @State private var taskProblem = "Enter problem"
    
    
    var body: some View {
        
        VStack {
            Form {
                TextField(text: $newClientName, prompt: Text("Enter client name")) {
                    Text("Client name")
                }
                
                TextField(text: $newClientSurname, prompt: Text("Enter client surname")) {
                    Text("Client surname")
                }
                
                TextField(text: $newClientPhone, prompt: Text("Enter client phone")) {
                    Text("Client phone")
                }
                
                DatePicker(
                    "Start Date",
                    selection: $currentDate,
                    displayedComponents: [.date]
                )
                .datePickerStyle(.wheel)
                
                TextField(text: $taskModel, prompt: Text("Enter model")) {
                    Text("Model")
                }
                
                TextEditor(text: $taskProblem)
                
                
                Button("Add Task", action: addTask)
                    .buttonStyle(.borderedProminent)
            }
        }
        .padding()
        
    }
    
    private func addTask() {
        withAnimation {
            let newItem = Task(context: viewContext)
            let newClient = Client(context: viewContext)
            
            newItem.timestamp = currentDate
            newItem.id = UUID()
            newItem.model = taskModel
            newItem.problem = taskProblem
            
            newClient.name = newClientName
            newClient.surname = newClientSurname
            newClient.phone = newClientPhone
            
            newItem.client = newClient

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
