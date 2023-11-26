//
//  TopView.swift
//  Daangn_SwiftUI
//
//  Created by 배수호 on 11/25/23.
//

import SwiftUI

struct TopView: View {
    var body: some View {
        HStack{
            Text("광명동")
                .bold()
            Text("⌵")
                .offset(x: -3,y: -3)
                .bold()
                .font(.title2)
            Spacer()
            HStack{
                Image(systemName: "line.3.horizontal")
                    .padding(.trailing,10)
                Image(systemName: "magnifyingglass")
                    .padding(.trailing,10)
                Image(systemName: "bell")
                    .resizable()
                    .frame(width: 20,height: 20)
            }
            .padding(.horizontal)
        }
        .padding(.leading)
    }
}

#Preview {
    TopView()
}
