//
//  CalculateStatusTask.swift
//  GoodService
//
//  Created by Геннадий Ведерников on 21.11.2022.
//

import SwiftUI

struct CalculateStatusTask: View {
    
    let currentStatus: StatusTask = .new
    
    var body: some View {
        
        switch currentStatus {
        case .new:
            Text("Новый")
                .foregroundColor(.white)
                .frame(width: 70, height: 30)
                .background(Capsule().fill(.yellow).shadow(radius: 3))
        case .diagnostics:
            Text("Диагностика")
                .foregroundColor(.blue)
                .frame(width: 70, height: 30)
                .background(Capsule().fill(.blue).shadow(radius: 3))
        }
    }
}

struct CalculateStatusTask_Previews: PreviewProvider {
    static var previews: some View {
        CalculateStatusTask()
    }
}
