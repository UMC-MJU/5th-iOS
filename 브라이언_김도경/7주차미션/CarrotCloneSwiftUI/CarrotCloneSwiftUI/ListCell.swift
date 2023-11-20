//
//  ListCell.swift
//  CarrotCloneSwiftUI
//
//  Created by 김도경 on 11/19/23.
//

import SwiftUI

struct ListCell: View {
    var cellInfo : cellInfo
    
    var body: some View {
        HStack{
            if cellInfo.isAdvertise{
                Image("advertisePic")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .padding(.trailing,10)
            } else {
                Image(cellInfo.picName)
                    .resizable()
                    .frame(width: 100, height: 100)
            }
            
            VStack(alignment:.leading){
                Text(cellInfo.title)
                    .font(.system(size: 14))
                    .fontWeight(.light)
                    .padding(.vertical, 3)
                Text(cellInfo.location + " . " + cellInfo.date)
                    .font(.system(size: 11))
                    .foregroundStyle(.gray)
                HStack{
                    if cellInfo.isReserved {
                        Text("예약중")
                            .font(.system(size: 10))
                            .foregroundStyle(.white)
                            .padding(4)
                            .background(.green)
                            .clipShape(.rect(cornerRadius: 4))
                    }
                    if cellInfo.isAdvertise {
                        
                    } else {
                        Text(cellInfo.priceText)
                            .font(.system(size: 16))
                            .fontWeight(.bold)
                    }
                }
                .padding(.vertical, 1)
                
                Spacer()
            }
            .frame(maxHeight: 110)
        }//Hstack
        
    }
}

#Preview {
    ListCell(cellInfo:cellInfo(picName: "airpod", title: "싸게 싸게 팔겡~~", location: "서울시 양천구 신정3동", date: "3일전", price : 10000, isAdvertise: true))
}
