//
//  BodyView.swift
//  BaeMinMainView
//
//  Created by 김도경 on 11/13/23.
//

import SwiftUI

struct BodyView: View {
    var body: some View {
        ScrollView{
            //Counpon
            CouponView()
            //배달 관련
            DeliveryOptionView()
            //대용량 특가
            BigSaleView()
            //Banner
            Image("Banner")
                .resizable()
                .frame(minHeight: 100,maxHeight: 130)
                
        }
        .background(Color(.secondarySystemBackground))
        .padding(.horizontal)
    }
}
struct DeliveryOptionView : View {
    var body: some View{
        HStack{
            Image("Option1")
                .resizable()
                .frame(maxWidth: .infinity)
                .frame(height: 130)
            Image("Option2")
                .resizable()
                .frame(maxWidth: .infinity)
                .frame(height: 130)
            Image("Option3")
                .resizable()
                .frame(maxWidth: .infinity)
                .frame(height: 130)
        }
    }
}

struct BigSaleView : View {
    let names=["인기상품",
               "신상품",
               "특가",
               "쌀·잡곡",
               "화장지",
               "생수·음료",
               "즉석밥",
               "통조림",
               "헤어·바디",
               "건강식품"]
    let columns = [GridItem(.flexible()),
                   GridItem(.flexible()),
                   GridItem(.flexible()),
                   GridItem(.flexible()),
                   GridItem(.flexible())]
    let index = Array(0..<10)
    
    var body: some View{
        VStack{
            //Header
            HStack{
                Text("대용량특가")
                    .font(.system(size: 25))
                    .fontWeight(.heavy)
                Text("많이 살수록 더 저렴하죠")
                Spacer()
                Image(systemName: "chevron.right")
            }
            //Options
            LazyVGrid(columns: columns, spacing: 0) {
                           ForEach(index, id: \.self) {i in
                               VStack{
                                   Image("c\(i+1)")
                                       .resizable()
                                       .frame(width: 60,height: 70)
                                   Text(names[i])
                                       .font(.system(size: 14))
                               }
                           }
                       }
        }
        .padding()
        .background(.white)
        .clipShape(.rect(cornerRadius:10))
        
    }
}

struct CouponView : View {
    var body: some View{
        HStack{
            Spacer()
            Text("집콕러세요?")
                .padding(.leading)
            Text("30% 쿠폰")
                .bold()
            Text("드려요!")
            Image("Coupon")
            Spacer()
        }
        .background(.white)
        .clipShape(.rect(cornerRadius: 10))
        .overlay(RoundedRectangle(cornerRadius: 10)
                    .stroke(AngularGradient(gradient: Gradient(colors: [.red, .yellow, .green, .blue, .purple, .red]), center: .center), lineWidth: 1))
    }
}

#Preview {
    VStack{
        BodyView()
    }
}
