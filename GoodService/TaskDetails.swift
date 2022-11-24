//
//  TaskDetails.swift
//  GoodService
//
//  Created by Геннадий Ведерников on 21.11.2022.
//

import SwiftUI

struct TaskDetails: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @ObservedObject var item: Task
    @State private var isPresented = false
    
    var body: some View {
        
        
        VStack {
            ScrollView {
                
                VStack {
                    Label(item.id2.formatted(), systemImage: "signature")
                    
                    NavigationLink(destination: InfoAboutClient(item: item)) {
                        Text("\(item.client?.name ?? "") \(item.client?.surname ?? "")")
                    }
                    
                    Label("Оборудование:", systemImage: "tv.and.hifispeaker.fill")
                    
                    Text("Brand: \(item.brand ?? "")")
                    Text("Model: \(item.model ?? "")")
                }
                .font(.title)
                
                Text(item.timestamp!, formatter: itemFormatter)
                
                DevicePath(
                    item: item,
                    isPresented: $isPresented,
                    diagnosticsDescription: item.diagnosticProblem ?? ""
                )
            }
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Next step") {
                        item.status = Int16(nextStep())
                        isPresented.toggle()
                    }
                }
            })
            .padding()
        }
    }
    
    private func nextStep() -> Int {
        if item.status == 0 {
            item.status = 1
            saveCoreData()
            return 1
        } else if item.status == 1 && !item.diagnosticBool {
            item.status = 1
            item.diagnosticBool = true
            saveCoreData()
            return 1
        } else if item.status == 1 && item.diagnosticBool {
            item.status = 2
            item.diagnosticBool = true
            saveCoreData()
            return 2
        } else if item.status == 2 {
            item.status = 3
            saveCoreData()
            return 3
        } else if item.status == 3 {
            item.status = 4
            saveCoreData()
            return 4
        } else if item.status == 4 {
            item.status = 5
            saveCoreData()
            return 5
        } else if item.status == 5 {
            item.status = 6
            saveCoreData()
            return 6
        } else if item.status == 6 {
            item.status = 7
            saveCoreData()
            return 7
        } else if item.status == 7 {
            print("Поздравляем с завершением!")
            saveCoreData()
            return 7
        } else {
            print("неверное значение")
            saveCoreData()
            return 7
        }
    }
    private func saveCoreData() {
        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
}


private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

//struct TaskDetails_Previews: PreviewProvider {
//    static var previews: some View {
//        TaskDetails(item: )
//    }
//}

