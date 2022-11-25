//
//  DevicePath.swift
//  GoodService
//
//  Created by Геннадий Ведерников on 22.11.2022.
//

import SwiftUI

struct DevicePath: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @ObservedObject var item: Task
    
    @Binding var isPresentedDiagnostics: Bool
    @Binding var isPresentedArgeement: Bool
    @Binding var isPresentedRepair: Bool
    @Binding var isPresentedReady: Bool
    @Binding var isPresentedPaymentPrice: Bool
    @Binding var isPresentedPaymentBool: Bool
    @Binding var isPresentedPuckupDevice: Bool
    
    @State private var diagnosticsDescription: String = ""
    @State private var argeementBool: Bool = false
    @State private var repairDescription: String = ""
    @State private var readyBool: Bool = false
    @State private var paymentPrice: String = ""
    @State private var paymentBool: Bool = false
    @State private var pickupDevice: Bool = false

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

            
            //Diagnostics
            CustomCell(
                time: "\(item.timestampDiagnostics?.formatted() ?? "")",
                color1: item.status >= 1 ? .yellow : .gray,
                color2: item.status >= 2 ? .yellow : .gray,
                image: "clock.arrow.2.circlepath",
                title: "Диагностика",
                description: item.diagnosticProblem ?? "Диагностика не произведена"
            )
            .alert("Результаты диагностики", isPresented: $isPresentedDiagnostics) {
                
                TextField("Проблемы", text: $diagnosticsDescription)
                
                Button("Готово") {
                    item.diagnosticProblem = diagnosticsDescription
                    item.timestampDiagnostics = Date()
                    saveCoreData()
                }
                Button("Cancel", role: .cancel, action: {})
            } message: {
                Text("Введите неисправности, выявленные при диагностике")
            }
            
            //Согласование
            CustomCell(
                time: "\(item.timestampAgreement?.formatted() ?? "")",
                color1: item.status >= 2 ? .yellow : .gray,
                color2: item.status >= 3 ? .yellow : .gray,
                image: "phone",
                title: "Согласование",
                description: item.agreementBool ? "Согласование на ремонт получено" : "Согласование не производилось"
            )
            .alert("Согласование", isPresented: $isPresentedArgeement) {
                
                Button("Согласовано") {
                    item.agreementBool = true
                    item.timestampAgreement = Date()
                    saveCoreData()
                }
                Button("ГАЛЯ, ОТМЕНА!", role: .cancel, action: {})
            } message: {
                Text("Нужно согласовать сумму ремонта и сроки.")
            }
            
            //Ремонт
            CustomCell(
                time: "\(item.timestampRepair?.formatted() ?? "")",
                color1: item.status >= 3 ? .yellow : .gray,
                color2: item.status >= 4 ? .yellow : .gray,
                image: "memorychip",
                title: "Ремонт",
                description: item.repair ?? "Ремонт не производился"
            )
            .alert("Ремонт", isPresented: $isPresentedRepair) {
                
                TextField("Введите запчасти", text: $repairDescription)
                
                Button("Готово") {
                    item.repair = repairDescription
                    item.timestampRepair = Date()
                    saveCoreData()
                }
                Button("Ничего не готово", role: .cancel, action: {})
            } message: {
                Text("Напишите, какие запчасти вы использовали")
            }
            
            //Готов
            CustomCell(
                time: "\(item.timestampReady?.formatted() ?? "")",
                color1: item.status >= 4 ? .yellow : .gray,
                color2: item.status >= 5 ? .yellow : .gray,
                image: "bolt.fill",
                title: "Готов",
                description: item.ready ? "Готов" : "Еще не готов"
            )
            .alert("Ремонт завершен", isPresented: $isPresentedReady) {
                
                Button("Ура!") {
                    item.ready = true
                    item.timestampReady = Date()
                    saveCoreData()
                }
                Button("Ничего не готово", role: .cancel, action: {})
            } message: {
                Text("Поздравляем с окончанием ремонта! ")
            }
            
            //Выставите счет
            CustomCell(
                time: "\(item.timestampPayment?.formatted() ?? "")",
                color1: item.status >= 5 ? .yellow : .gray,
                color2: item.status >= 6 ? .yellow : .gray,
                image: "creditcard",
                title: "Счет на оплату",
                description: item.paymentPrice ?? "Счет не выставлялся"
            )
            .alert("Денюжки", isPresented: $isPresentedPaymentPrice) {
                
                TextField("Введите сумму", text: $paymentPrice)
                
                Button("Готово") {
                    item.paymentPrice = paymentPrice
                    item.timestampPayment = Date()
                    saveCoreData()
                }
                Button("Ничего не готово", role: .cancel, action: {})
            } message: {
                Text("Введите сумму, которую вы будете требовать за ремонт.")
            }
            
            //Получение оплаты
            CustomCell(
                time: "\(item.timestampPaymentBool?.formatted() ?? "")",
                color1: item.status >= 6 ? .yellow : .gray,
                color2: item.status >= 7 ? .yellow : .gray,
                image: "dollarsign",
                title: "Оплата получена",
                description: item.paymentBool ? "Оплата получена" : "Оплата не получена"
            )
            .alert("Получение оплаты", isPresented: $isPresentedPaymentBool) {
                
                Button("Готово") {
                    item.paymentBool = true
                    item.timestampPaymentBool = Date()
                    saveCoreData()
                }
                Button("Ничего не готово", role: .cancel, action: {})
            } message: {
                Text("Вы получили оплату от клиента?")
            }
            
            //Забрали
            CustomCell(
                time: "\(item.timestampPickup?.formatted() ?? "")",
                color1: item.status >= 7 ? .yellow : .gray,
                color2: item.status >= 7 ? .yellow : .gray,
                image: "figure.walk.motion",
                title: "Забрали",
                description: item.pickupDevice ? "Девайс забрали" : "Девайс не забрали"
            )
            .alert("Забрали?", isPresented: $isPresentedPuckupDevice) {
                
                Button("ДА!") {
                    item.pickupDevice = true
                    item.timestampPickup = Date()
                    saveCoreData()
                }
                Button("Нихуя еще не забрали", role: .cancel, action: {})
            } message: {
                Text("Вы избавились от этого мусора?")
            }
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


//struct DevicePath_Previews: PreviewProvider {
//    static var previews: some View {
//        DevicePath(item: Task)
//    }
//}
