//
//  priceView.swift
//  BaeminClone(SwiftUI)
//
//  Created by 김도경 on 11/27/23.
//

import SwiftUI

struct priceView : View {
    @State public var isFillone : Bool = true
    @State public var isFilltwo : Bool = false
    
    var body: some View {
        VStack{
            HStack{
                Text("가격")
                    .font(.title2)
                    .bold()
                Spacer()
                ZStack{
                    Color(.blue)
                        .opacity(0.1)
                        .frame(width: 35,height: 30)
                        .clipShape(.rect(cornerRadius: 15))
                    Text("필수")
                        .bold()
                        .font(.system(size: 12))
                        .foregroundStyle(.blue)
                }
            }
            .padding(.top, 5)
            priceList(isFill:$isFillone,option: "M", price: 20000)
            priceList(isFill:$isFilltwo,option:"L", price: 23000)
        }
    }
}

struct priceList : View {
    @Binding var isFill : Bool
    let option : String
    let price : Int
    
    var body: some View {
        HStack{
            Button(action: {
                isFill.toggle()
            }, label: {
                radioButton(isfill: $isFill)
            })
            Text(option)
                .font(.system(size: 20))
            Spacer()
            Text(OrderSelectionView.toWon(price))
                .font(.system(size: 20))
        }
        .padding(.vertical)
    }
}

struct radioButton : View {
    @Binding var isfill : Bool
    
    var body: some View {
        ZStack{
            Color(isfill ? .mint : .gray)
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                .frame(width: 30,height: 30)
            Color(.white)
                .clipShape(Circle())
                .frame(width: isfill ? 10 : 25)
           
        }
    }
}

#Preview {
    priceView()
}
