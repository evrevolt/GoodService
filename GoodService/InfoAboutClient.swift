//
//  InfoAboutClient.swift
//  GoodService
//
//  Created by Геннадий Ведерников on 21.11.2022.
//

import SwiftUI

struct InfoAboutClient: View {
    
    var item: Task
    
    var body: some View {
        Text("Имя клиента: \((item.client?.name) ?? "No name")")
        Text("Фамилия клиента: \((item.client?.name) ?? "No surname")")
        Text("Телефон клиента: \((item.client?.phone) ?? "No phone")")
    }
}

//struct InfoAboutClient_Previews: PreviewProvider {
//    static var previews: some View {
//        InfoAboutClient(item: )
//    }
//}
