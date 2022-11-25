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
    
    @State private var isPresentedDiagnistics = false
    @State private var isPresentedArgeement = false
    @State private var isPresentedRepair = false
    @State private var isPresentedReady = false
    @State private var isPresentedPaymentPrice = false
    @State private var isPresentedPaymentBool = false
    @State private var isPresentedPuckupDevice = false
    
    var body: some View {
        
        
        VStack {
            ScrollView {
                
                VStack(alignment: .leading) {
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
                    isPresentedDiagnostics: $isPresentedDiagnistics,
                    isPresentedArgeement: $isPresentedArgeement,
                    isPresentedRepair: $isPresentedRepair,
                    isPresentedReady: $isPresentedReady,
                    isPresentedPaymentPrice: $isPresentedPaymentPrice,
                    isPresentedPaymentBool: $isPresentedPaymentBool,
                    isPresentedPuckupDevice: $isPresentedPuckupDevice
                )
            }
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Next step") {
//                        item.status = Int16(nextStep())
//                        isPresentedDiagnistics.toggle()
                        
                        nextStep()
                        
                    }
                }
            })
            .padding()
        }
    }
    
    private func nextStep() {
        if item.status == 0 {
            item.status = 1
            saveCoreData()
            isPresentedDiagnistics.toggle()
            
        } else if item.status == 1 {
            item.status = 2
            saveCoreData()
            isPresentedArgeement.toggle()

        } else if item.status == 2 {
            item.status = 3
            saveCoreData()
            isPresentedRepair.toggle()

        } else if item.status == 3 {
            item.status = 4
            saveCoreData()
            isPresentedReady.toggle()

        } else if item.status == 4 {
            item.status = 5
            saveCoreData()
            isPresentedPaymentPrice.toggle()

        } else if item.status == 5 {
            item.status = 6
            saveCoreData()
            isPresentedPaymentBool.toggle()

        } else if item.status == 6 {
            item.status = 7
            saveCoreData()
            isPresentedPuckupDevice.toggle()

        } else if item.status == 7 {
            print("Поздравляем с завершением!")

        } else {
            print("Неверное значение")

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

