//
//  BottomView.swift
//  BaeMin_Navigation
//
//  Created by 배수호 on 11/27/23.
//

import SwiftUI

struct BottomView: View {
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text("배달최소주문금액")
                    .font(.system(size: 12))
                    .foregroundStyle(.gray)
                Text("17,000원")
                    .font(.system(size: 12))
            }
            Button(action: {
            
            }){
                Text("20,000원 담기")
                    .font(.system(size: 20))
                    .foregroundStyle(.white)
                    .bold()
            }
            .frame(width:260, height: 60)
            .background(Color("mainColor"))
            .cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
        }
    }
}

#Preview {
    BottomView()
}
