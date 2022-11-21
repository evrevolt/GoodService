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
        Text("Item at \(item.timestamp ?? Date(), formatter: itemFormatter)")
        Text("Hello, Named!")
        Text((item.client?.name)!)
        Text((item.client?.surname!)!)
        Text((item.client?.phone!)!)
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
