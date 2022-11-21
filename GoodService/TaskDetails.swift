//
//  TaskDetails.swift
//  GoodService
//
//  Created by Геннадий Ведерников on 21.11.2022.
//

import SwiftUI

struct TaskDetails: View {
    
    var item: Task
    
    var body: some View {
        
        VStack {
            
            Text("Параметры заказа")
                .font(.largeTitle)
            Spacer()
            
            InfoAboutClient(item: item)
            
            Spacer()
            
            Text("Model: \((item.model) ?? "No model name")")
            Text("Problem: \((item.problem) ?? "No problem")")
                .lineLimit(5)
            
            Spacer()
            
            Text(item.id?.description ?? UUID().description)
            
            Text("Дата создания заказа: \n \(item.timestamp ?? Date(), formatter: itemFormatter)")
        }
        .padding()
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
