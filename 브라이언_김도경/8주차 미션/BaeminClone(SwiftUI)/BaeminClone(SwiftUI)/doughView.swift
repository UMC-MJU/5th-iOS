//
//  doughView.swift
//  BaeminClone(SwiftUI)
//
//  Created by 김도경 on 11/27/23.
//

import SwiftUI

struct doughView : View {
    var body: some View {
        VStack{
            HStack{
                VStack(alignment:.leading){
                    Text("도우변경")
                        .font(.title2)
                        .bold()
                    Text("최대 1개 선택")
                        .font(.caption)
                        .foregroundStyle(.gray)
                }
                Spacer()
                ZStack{
                    Color(.gray)
                        .opacity(0.1)
                        .frame(width: 35,height: 30)
                        .clipShape(.rect(cornerRadius: 15))
                    Text("선택")
                        .bold()
                        .font(.system(size: 12))
                        .foregroundStyle(.gray)
                }
            }
            doughList(option: "크림리치골드 크러스트", price: 4500)
        }//Vstack
    }
}

struct doughList: View {
        @State var isFill : Bool = true
        let option : String
        let price : Int
        
    var body: some View {
        VStack{
            HStack{
                Button(action: {
                    isFill.toggle()
                }, label: {
                    boxButton(isfill: $isFill)
                })
                Text(option)
                    .font(.system(size: 20))
                Spacer()
                Text("+" + OrderSelectionView.toWon(price))
                    .font(.system(size: 20))
            }
            .padding(.vertical)
            
        }
    }
}


struct boxButton : View {
    @Binding var isfill : Bool
    
    var body: some View {
        ZStack{
            Color(.gray)
                .clipShape(.rect)
                .frame(width: 20,height: 20)
            Color(isfill ? .gray : .white)
                .clipShape(.rect)
                .frame(width: 15,height: 15)
        }
    }
}
#Preview {
    doughView()
}
