//
//  BodyView.swift
//  BaeMin_Navigation
//
//  Created by 배수호 on 11/27/23.
//

import SwiftUI

struct BodyView: View {
    var body: some View {
        ScrollView{
            VStack{
                Image("img_pizza")
                    .resizable()
                    .frame(height: 200)
                HStack{
                    Image("hot")
                        .resizable()
                        .frame(width: 40, height: 40)
                    Text("[재주문 1위] 바싹불고기피자")
                        .font(.title2)
                        .bold()
                    Spacer()
                }
                .padding(10)
                
                VStack(alignment: .leading){
                    Text("바싹 익힌 불고기의 풍미를 입안 가득 느낄 수 있는 자가제빵선명희피자의 야심작")
                        .foregroundStyle(.gray)
                    HStack{
                        Text("영양성분 및 알레르기성분 표기 보기")
                            .font(.system(size:12))
                            .frame(width: 180,height: 25)
                            .background(Color("paleGray"))
                            .cornerRadius(20)
                        Spacer()
                    }
                }
                .padding(.horizontal)
                .padding(.bottom)
                Divider()
                    .frame(minHeight: 10)
                    .background(Color("mylightGray"))
                    .overlay(Color("mylightGray"))
                priceTab()
                Divider()
                    .frame(minHeight: 10)
                    .background(Color("mylightGray"))
                    .overlay(Color("mylightGray"))
                Spacer()
                    
            }
            
        }
    }
}

struct priceTab:View {
    var body: some View{
        VStack{
            HStack{
                Text("가격")
                    .bold()
                    .font(.title2)
                Spacer()
                Text("필수")
                    .font(.system(size:12))
                    .frame(width: 40, height: 25 )
                    .foregroundStyle(.blue)
                    .background(Color("paleBlue"))
                    .cornerRadius(20)
                
            }
            .padding()
            HStack{
                Image("clicked_btn")
                    .resizable()
                    .frame(width: 20, height: 20)
                Text("M")
                Spacer()
                Text("20,000원")
            }
            .padding()
            HStack{
                Image("unchecked_btn")
                    .resizable()
                    .frame(width: 20, height: 20)
                Text("L")
                Spacer()
                Text("23,000원")
            }
            .padding()
            
        }
        
    }
}
#Preview {
    BodyView()
}
