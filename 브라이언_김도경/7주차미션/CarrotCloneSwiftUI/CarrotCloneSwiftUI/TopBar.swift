//
//  TopBar.swift
//  CarrotCloneSwiftUI
//
//  Created by 김도경 on 11/19/23.
//

import SwiftUI

struct TopBar: View {
    var body: some View {
        HStack{
            Text("광명동")
                .font(.system(size: 25))
                .fontWeight(.bold)
            Spacer()
            Image(systemName: "line.3.horizontal")
                .resizable()
                .frame(width: 20,height: 20)
                .padding(.trailing)
            Image(systemName: "magnifyingglass")
                .resizable()
                .frame(width: 25,height: 25)
                .padding(.trailing)
            Image(systemName: "bell")
                .resizable()
                .frame(width: 25,height: 25)
            
        }
        .padding(.horizontal)
        .frame(width: .infinity)
    }
}

#Preview {
    TopBar()
}
