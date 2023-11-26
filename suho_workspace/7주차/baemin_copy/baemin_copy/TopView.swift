//
//  TopView.swift
//  baemin_copy
//
//  Created by 배수호 on 11/24/23.
//

import SwiftUI

struct TopView: View {
    var body: some View {
        VStack{
            Top()
                .padding(.top)
                .padding(.horizontal)
            SearchBar()
                .padding(.horizontal)
                .padding(.bottom)
        }
        .background(.mint)
        .roundedCorner(10, corners: [.bottomLeft,.bottomRight])

    }
}

struct Top: View{
    var body: some View{
        HStack{
            Text("우리집 ▾")
                .font(.title2)
                .fontWeight(.bold)
            
            Spacer()
            HStack{
                Image(systemName: "square.grid.2x2")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .padding(.trailing,10)
                
                Image(systemName: "bell")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .padding(.trailing, 10)
                Image(systemName: "cart")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .padding(.trailing, 10)
            }
        }
        .foregroundColor(.white)
    }
}

struct SearchBar: View{
    @State var searchText = ""
    var body: some View{
        HStack{
            Image(systemName: "magnifyingglass")
                .padding(.leading)
            TextField("찾는 맛집 이름이 뭐예요?", text: $searchText)
                .frame(height: 40)
        }
        .background(.white)
        .foregroundColor(.mint)
    }
}

#Preview {
    TopView()
}
