//
//  DevicePath.swift
//  GoodService
//
//  Created by Геннадий Ведерников on 22.11.2022.
//

import SwiftUI

struct SaveDetails: Identifiable {
    let name: String
    let error: String
    let id = UUID()
}

struct DevicePath: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @ObservedObject var item: Task
    @Binding var isPresented: Bool
    @State private var details: SaveDetails?
    
    @State var diagnosticsDescription: String

    var body: some View {
        VStack {
            //New order
            CustomCell(
                time: "\(item.timestamp?.formatted() ?? "")",
                color1: .yellow,
                color2: item.status >= 1 ? .yellow : .gray,
                image: "pc",
                title: "Новый",
                description: "\(item.problem ?? "")"
            )
            .alert("Text", isPresented: $isPresented) {
                TextField("Username", text: $diagnosticsDescription)
                
                Button("1", role: .none) {
                    item.diagnosticProblem = diagnosticsDescription
                    do {
                        try viewContext.save()
                    } catch {
                        let nsError = error as NSError
                        fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
                    }
                }
                Button("2", role: .destructive) {
                    
                }
            }
            
            //Diagnostics
            CustomCell(
                time: "10:10",
                color1: item.status >= 1 ? .yellow : .gray,
                color2: item.status >= 2 ? .yellow : .gray,
                image: "clock.arrow.2.circlepath",
                title: "Диагностика",
                description: item.diagnosticProblem ?? "Диагностика не произведена"
            )
            
            //Согласование
            CustomCell(
                time: "10:10",
                color1: item.status >= 2 ? .yellow : .gray,
                color2: item.status >= 3 ? .yellow : .gray,
                image: "phone",
                title: "Согласны?",
                description: "description"
            )
            
            //Ремонт
            CustomCell(
                time: "10:10",
                color1: item.status >= 3 ? .yellow : .gray,
                color2: item.status >= 4 ? .yellow : .gray,
                image: "memorychip",
                title: "Ремонт",
                description: "description"
            )
            
            //Готов
            CustomCell(
                time: "10:10",
                color1: item.status >= 4 ? .yellow : .gray,
                color2: item.status >= 5 ? .yellow : .gray,
                image: "bolt.fill",
                title: "Готов",
                description: "description"
            )
            
            //Выставите счет
            CustomCell(
                time: "10:10",
                color1: item.status >= 5 ? .yellow : .gray,
                color2: item.status >= 6 ? .yellow : .gray,
                image: "creditcard",
                title: "Счет на оплату",
                description: "description"
            )
            
            //Получение оплаты
            CustomCell(
                time: "10:10",
                color1: item.status >= 6 ? .yellow : .gray,
                color2: item.status >= 7 ? .yellow : .gray,
                image: "dollarsign",
                title: "Оплата получена",
                description: "description"
            )
            
            //Забрали
            CustomCell(
                time: "10:10",
                color1: item.status >= 7 ? .yellow : .gray,
                color2: item.status >= 7 ? .yellow : .gray,
                image: "figure.walk.motion",
                title: "Забрали",
                description: "description"
            )
        }
    }
}

//struct DevicePath_Previews: PreviewProvider {
//    static var previews: some View {
//        DevicePath(item: Task)
//    }
//}
