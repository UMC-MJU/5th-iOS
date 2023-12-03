//
//  TopView.swift
//  BaeMin_Navigation
//
//  Created by 배수호 on 12/2/23.
//

import SwiftUI

struct TopView: View {
    var body: some View {
        VStack{
            HStack{
                Image(systemName: "arrow.backward")
                Spacer()
                Text("      장바구니")
                    .bold()
                    .font(.title2)
                Spacer()
                HStack{
                    Image(systemName: "house")
                    Image(systemName: "person.3.sequence")
                        .resizable()
                        .frame(width: 15, height: 18)
                }
            }
            .padding()
            HStack{
                Spacer()
                Text("배달/포장 2")
                    .underline()
                    .bold()
                Spacer()
                Text("배민스토어")
                Spacer()
                Text("대용량특가")
                Spacer()
                Text("전국별미")
                Spacer()
            }
            Divider()
            HStack{
                Text("배달")
                    .bold()
                    .font(.title2)
                Image(systemName: "chevron.down")
                Text("로 받을게요")
                    .font(.title3)
                Spacer()
            }
            .padding()
            Divider()
                .frame(minHeight: 10)
                .background(Color("mylightGray"))
                .overlay(Color("mylightGray"))
            
            HStack{
                Image("small")
                    .resizable()
                    .frame(width: 20, height: 20)
                Text("자가제빵 선명희피자 광명점")
                    .bold()
                Spacer()
                Image(systemName: "clock")
                Text("41~45분 후 도착")
                    .font(.system(size: 14))
            }
            .padding()
            Divider()
            VStack{
                HStack{
                    Text("[재주문1위] 바싹불고기피자")
                        .bold()
                    Spacer()
                    Image(systemName: "multiply")
                }
                .padding()
                HStack{
                    Image("img_pizza")
                        .resizable()
                        .frame(width: 80,height: 80)
                    VStack(alignment: .leading){
                        Text("• 가격 : M (20,000원)")
                            .foregroundStyle(.gray)
                            .font(.system(size: 14))
                            .bold()
                            .padding(.bottom,2)
                        Text("20,000원")
                        Spacer()
                            .frame(height: 30)
                    }
                    
                    Spacer()
                }
                .padding(.horizontal)
                HStack{
                    Spacer()
                    Text("옵션변경")
                        .frame(height: 40)
                        .padding(.horizontal)
                        .overlay(
                            Rectangle()
                                .stroke(Color.gray, lineWidth: 1))
                    HStack{
                        Image(systemName: "minus")
                            .foregroundColor(.gray)
                        Text("1")
                            .padding(.horizontal)
                        Image(systemName: "plus")
                    }
                    .padding(.horizontal)
                    .frame(height: 40)
                    .overlay(
                        Rectangle()
                        .stroke(Color.gray, lineWidth: 1)
        
                    )
                }
                .padding()
            }
            Divider()
            Spacer()
            
        }
    }
}
#Preview {
    TopView()
}

