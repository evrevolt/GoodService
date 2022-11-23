//
//  ContentView.swift
//  GoodService
//
//  Created by Геннадий Ведерников on 20.11.2022.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    @State private var orderIsPresented = false
    
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Task.timestamp, ascending: true)],
        animation: .default)
    
    private var items: FetchedResults<Task>
    
    var body: some View {
        NavigationView {
            List {
                ForEach(items) { item in
                    NavigationLink(destination: TaskDetails(item: item), label: {
                        HStack {
                            Text("\(item.brand ?? "No") \(item.model ?? "Name")")
                            Spacer()
                            CalculateStatusTask()
                                .multilineTextAlignment(.leading)
                        }
                    })
                }
                .onDelete(perform: deleteItems)
            }
            .sheet(isPresented: $orderIsPresented) {
                NewOrderView(orderIsPresented: $orderIsPresented)
            }
            .navigationBarItems(trailing: Button(action: {
                orderIsPresented = true
            }, label: {
                Image(systemName: "plus.circle")
                    .imageScale(.large)
            }))
            .navigationTitle("Заказы")

            Text("Select an item")
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)

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

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
