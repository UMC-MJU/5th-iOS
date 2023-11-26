//
//  TabBar.swift
//  Daangn_SwiftUI
//
//  Created by 배수호 on 11/25/23.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        HStack{
            TabButton(image: "ic_home",labelname: "홈")
            Spacer()
            TabButton(image: "ic_list",labelname: "동네생활")
            Spacer()
            TabButton(image: "ic_location",labelname: "내 근처")
            Spacer()
            TabButton(image: "ic_chat",labelname: "채팅")
            Spacer()
            TabButton(image: "ic_user",labelname: "나의 당근")
            
        }
        .padding(.horizontal, 20)
    }
}

struct TabButton: View{
    var image: String = ""
    var labelname: String = ""
    var body: some View {
        Button{
        }label: {
            VStack{
                Image(image)
                    .resizable()
                    .frame(width: 26,height: 26)
                Text(labelname)
                    .font(.system(size: 9))
                    .foregroundStyle(.black)
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    TabBar()
}
