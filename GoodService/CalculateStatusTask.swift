//
//  CalculateStatusTask.swift
//  GoodService
//
//  Created by Геннадий Ведерников on 21.11.2022.
//

import SwiftUI

struct CalculateStatusTask: View {
    
    var currentStatus: StatusTask.RawValue
    
    var body: some View {
        
        switch currentStatus {
        case 0:
            Text("Новый")
                .foregroundColor(.white)
                .frame(width: 70, height: 30)
                .background(Capsule().fill(.yellow).shadow(radius: 3))
        case 1:
            Text("Диагностика")
                .foregroundColor(.white)
                .frame(width: 120, height: 30)
                .background(Capsule().fill(.blue).shadow(radius: 3))
        case 2:
            Text("Согласование")
                .foregroundColor(.white)
                .frame(width: 120, height: 30)
                .background(Capsule().fill(.cyan).shadow(radius: 3))
        case 3:
            Text("Ремонт")
                .foregroundColor(.white)
                .frame(width: 70, height: 30)
                .background(Capsule().fill(.red).shadow(radius: 3))
        case 4:
            Text("Готов")
                .foregroundColor(.white)
                .frame(width: 70, height: 30)
                .background(Capsule().fill(.green).shadow(radius: 3))
        case 5:
            Text("Счет")
                .foregroundColor(.white)
                .frame(width: 70, height: 30)
                .background(Capsule().fill(.orange).shadow(radius: 3))
        case 6:
            Text("Оплатили")
                .foregroundColor(.white)
                .frame(width: 100, height: 30)
                .background(Capsule().fill(.mint).shadow(radius: 3))
        case 7:
            Text("Забрали")
                .foregroundColor(.white)
                .frame(width: 80, height: 30)
                .background(Capsule().fill(.teal).shadow(radius: 3))
        default:
            Text("NoName")
                .foregroundColor(.white)
                .frame(width: 70, height: 30)
                .background(Capsule().fill(.blue).shadow(radius: 3))
        }
    }
}

struct CalculateStatusTask_Previews: PreviewProvider {
    static var previews: some View {
        CalculateStatusTask(currentStatus: 0)
    }
}
