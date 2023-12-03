//
//  EndButtonView.swift
//  BaeMin_Navigation
//
//  Created by 배수호 on 12/2/23.
//

import SwiftUI

struct EndButtonView: View {
    var body: some View {
        
        HStack{
            Image(systemName: "2.circle.fill")
                .resizable()
                .frame(width: 25,height: 25)
                .foregroundStyle(.white)
                .padding(.horizontal)
            Spacer()
            Text("배달 주문하기")
                .font(.system(size: 20))
                .foregroundStyle(.white)
                .bold()
            Spacer()
            Text("47,200원")
            .foregroundStyle(.white)
            .bold()
            .font(.system(size: 15))
            .padding(.horizontal)
        }
        .frame(width:360, height: 60)
        .background(Color("mainColor"))
        .cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    EndButtonView()
}
