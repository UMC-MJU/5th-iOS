//
//  TabBar.swift
//  BaeMinMainView
//
//  Created by 김도경 on 11/13/23.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        HStack{
            tabButton(image: "magnifyingglass",labelText: "검색")
            tabButton(image: "heart",labelText: "찜")
            Image("LOGO")
                .resizable()
                .frame(width: 65,height: 65)
                .offset(y: -20)
                .padding(.leading,10)
            tabButton(image: "list.bullet.rectangle.portrait",labelText: "주문내역")
            tabButton(image: "face.smiling",labelText: "my배민")
        }
        .frame(maxWidth: .infinity)
        .background(.white)
    }
}

struct tabButton : View{
    var image : String = ""
    var labelText : String = ""
    var body: some View{
        Button {
        } label: {
            VStack{
                Image(systemName: image)
                    .resizable()
                    .frame(width: 20,height: 20)
                    .foregroundStyle(.gray)
                Text(labelText)
                    .font(.system(size: 11))
                    .foregroundStyle(.gray)
            }
        }//button
        .padding(.horizontal)
    }
}

#Preview {
    VStack{
        TabBar()
    }
}
