//
//  HstackCell.swift
//  CarrotCloneSwiftUI
//
//  Created by 김도경 on 11/20/23.
//

import SwiftUI

struct HstackCell: View {
    
    var cellInfo : cellInfo
    
    var body: some View {
        VStack{
            Image(cellInfo.picName)
                .resizable()
                .frame(width: 100,height: 100)
            VStack(alignment:.leading){
                Text(cellInfo.title)
                    .font(.system(size: 13))
                    .fontWeight(.light)
                    .frame(width: 100)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                Text(cellInfo.priceText)
                    .font(.system(size: 18))
                    .fontWeight(.bold)
                    .padding(.top,-8)
            }
            .frame(maxWidth: 100)
        }
    }
}

#Preview {
    HstackCell(cellInfo:cellInfo(picName: "airpod", title: "싸게 싸게 팔겡~~", location: "서울시 양천구 신정3동", date: "3일전", price : 10000, isAdvertise: true))
}
