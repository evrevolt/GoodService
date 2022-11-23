//
//  DevicePath.swift
//  GoodService
//
//  Created by Геннадий Ведерников on 22.11.2022.
//

import SwiftUI

struct DevicePath: View {
    
    var item: Task
    @Binding var status: Int

    var body: some View {
        VStack {
            //New order
            CustomCell(
                time: "\(item.timestamp?.formatted() ?? "")",
                color1: .yellow,
                color2: status >= 1 ? .yellow : .gray,
                image: "pc",
                title: "Новый",
                subTitle: "Неисправность:",
                description: "\(item.problem ?? "")"
            )
            
            //Diagnostics
            CustomCell(
                time: "10:10",
                color1: status >= 1 ? .yellow : .gray,
                color2: status >= 2 ? .yellow : .gray,
                image: "clock.arrow.2.circlepath",
                title: "Диагностика",
                subTitle: "Sub title",
                description: "description"
            )
            
            //Согласование
            CustomCell(
                time: "10:10",
                color1: status >= 2 ? .yellow : .gray,
                color2: status >= 3 ? .yellow : .gray,
                image: "phone",
                title: "Согласны?",
                subTitle: "Sub title",
                description: "description"
            )
            
            //Ремонт
            CustomCell(
                time: "10:10",
                color1: status >= 3 ? .yellow : .gray,
                color2: status >= 4 ? .yellow : .gray,
                image: "memorychip",
                title: "Ремонт",
                subTitle: "Sub title",
                description: "description"
            )
            
            //Готов
            CustomCell(
                time: "10:10",
                color1: status >= 4 ? .yellow : .gray,
                color2: status >= 5 ? .yellow : .gray,
                image: "bolt.fill",
                title: "Готов",
                subTitle: "Sub title",
                description: "description"
            )
            
            //Выставите счет
            CustomCell(
                time: "10:10",
                color1: status >= 5 ? .yellow : .gray,
                color2: status >= 6 ? .yellow : .gray,
                image: "creditcard",
                title: "Счет на оплату",
                subTitle: "Sub title",
                description: "description"
            )
            
            //Получение оплаты
            CustomCell(
                time: "10:10",
                color1: status >= 6 ? .yellow : .gray,
                color2: status >= 7 ? .yellow : .gray,
                image: "dollarsign",
                title: "Оплата получена",
                subTitle: "Sub title",
                description: "description"
            )
            
            //Забрали
            CustomCell(
                time: "10:10",
                color1: status >= 7 ? .yellow : .gray,
                color2: status >= 7 ? .yellow : .gray,
                image: "figure.walk.motion",
                title: "Забрали",
                subTitle: "Sub title",
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
