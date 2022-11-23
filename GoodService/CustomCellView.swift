//
//  CustomCellView.swift
//  GoodService
//
//  Created by Геннадий Ведерников on 22.11.2022.
//

import SwiftUI

struct CustomCell: View {
    
    var time: String
    var color1: Color
    var color2: Color
    var image: String
    var title: String
    var subTitle: String
    var description: String
    
    var body: some View {
        
        HStack {
            Text(time)
                .frame(width: 50)
            ZStack {
                HStack {
                    Divider()
                        .frame(minWidth: 3, minHeight: 90, maxHeight: 90)
                        .background(color1)
                        .offset(x: 0, y: -50)
                    
                    Divider()
                        .frame(minWidth: 3, minHeight: 90, maxHeight: 90)
                        .background(color2)
                        .offset(x: -11, y: 50)
                    
                }
                .frame(width: 30)
                .padding(.horizontal, 0.0)
                
                Label("", systemImage: "circle.fill")
                    .foregroundColor(color1)
                    .offset(x: 0, y: 0)
            }
            
            Image(systemName: image)
                .resizable()
                .frame(width: 50, height: 50)
            Spacer()
            VStack {
                Text(title)
                    .font(.largeTitle)
                Text(subTitle)
                    .font(.title)
                Spacer()
                Text(description)
            }
        }
        .frame(height: 150)
        Divider()
    }
}

struct CustomCellView: View {
    var body: some View {
        
        VStack {
            CustomCell(
                time: "10:10",
                color1: .yellow,
                color2: .gray,
                image: "airplane",
                title: "Title",
                subTitle: "Sub title",
                description: "description"
            )
        }
    }
}

struct CustomCellView_Previews: PreviewProvider {
    static var previews: some View {
        CustomCellView()
    }
}
