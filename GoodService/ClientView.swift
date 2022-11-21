//
//  ClientView.swift
//  GoodService
//
//  Created by Геннадий Ведерников on 21.11.2022.
//

import SwiftUI

struct ClientView: View {
    
    @Binding var newClientName: String
    @Binding var newClientSurname: String
    @Binding var newClientPhone: String
    
    var body: some View {
        
        Label("Заказчик:", systemImage: "person")
        
        TextField(text: $newClientName, prompt: Text("Enter client name")) {
            Text("Client name")
        }
        
        TextField(text: $newClientSurname, prompt: Text("Enter client surname")) {
            Text("Client surname")
        }
        
        TextField(text: $newClientPhone, prompt: Text("Enter client phone")) {
            Text("Client phone")
                .keyboardType(.numberPad)
        }
    }
}

struct ClientView_Previews: PreviewProvider {
    static var previews: some View {
        ClientView(
            newClientName: .constant("Name"),
            newClientSurname: .constant("Surname"),
            newClientPhone: .constant("Phome number")
        )
    }
}
