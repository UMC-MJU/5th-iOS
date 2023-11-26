//
//  itemViewCell.swift
//  Daangn_SwiftUI
//
//  Created by 배수호 on 11/26/23.
//

import SwiftUI

struct itemViewCell: View {
    var imagename: String = ""
    var context: String = ""
    var location: String = ""
    var price: String = " "
    var state:Int = 0 // 0 == 판매중(defualt)
                      // 1 == 예약중
                      // 2 == 판매완료
    var chatnum :Int = 0
    var heartnum: Int = 0
    var body: some View{
        HStack{
            Image(imagename)
                .resizable()
                .frame(width: 130,height: 130)
                .padding(.trailing)
            VStack(alignment: .leading){
                Text(context)
                    .padding(.vertical,5)
                Text(location)
                    .font(.system(size: 14))
                    .foregroundStyle(.gray)
                    .padding(.bottom,1)
                HStack{
                    if state == 1 {
                        Text(" 예약중 ")
                            .padding(3)
                            .foregroundStyle(.white)
                            .background(Color("reserveColor"))
                            .font(.system(size: 13))
                            .cornerRadius(5)
                    }
                    else if state == 2 {
                        Text(" 판매완료 ")
                            .padding(3)
                            .foregroundStyle(.white)
                            .background(.gray)
                            .font(.system(size: 13))
                            .cornerRadius(5)
                    }
                    
                    Text(price)
                        .fontWeight(.bold)
                        .font(.system(size: 15))
                    
                }
                HStack(spacing: 2){
                    Spacer()
                    if chatnum != 0 {
                        Image(systemName: "message")
                            .foregroundColor(.gray)
                        Text("\(chatnum)")
                            .foregroundColor(.gray)
                            .font(.system(size: 14))
                    }
                    if heartnum != 0 {
                        Image(systemName: "heart")
                            .foregroundColor(.gray)
                        Text("\(heartnum)")
                            .foregroundColor(.gray)
                            .font(.system(size: 14))
                    }
                }
                .padding(.trailing)
                
            }
        }
        .padding(.leading,5)    }
}


#Preview {
    itemViewCell()
}
