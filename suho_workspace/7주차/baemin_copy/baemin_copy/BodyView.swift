//
//  BodyView.swift
//  baemin_copy
//
//  Created by 배수호 on 11/24/23.
//

import SwiftUI

struct BodyView: View {
    var body: some View {
        ScrollView{
            CouponView()
            DeliveryOptionView()
            CategoryView()
            Image("Banner")
                .resizable()
                .frame(minWidth: 100,maxHeight: 130)
        }
        .padding(.horizontal)
        .background(Color(.secondarySystemBackground))
        
    }
}
struct CategoryView: View{
    let columns = [GridItem(.flexible()),
                   GridItem(.flexible()),
                   GridItem(.flexible()),
                   GridItem(.flexible()),
                   GridItem(.flexible())]
    let name = ["인기상품","신상품","특가","쌀・잡곡","화장지",
                "생수・음료","즉석밥","통조림", "헤어・바디","건강식품"]
    var body: some View{
        VStack{
            HStack{
                Text("대용량 특가")
                    .bold()
                    .font(.title2)
                Text("많이 살수록 저렴하죠")
                    .font(.subheadline)
                Spacer()
                Image(systemName: "chevron.right")
            }
            LazyVGrid(columns: columns, spacing: 0){
                ForEach(Array(0..<10), id: \.self) {i in
                    VStack{
                        Image("c\(i+1)")
                            .resizable()
                            .frame(width: 60, height: 70)
                        Text(name[i])
                            .font(.system(size: 14))
                        
                    }
                }
                
            }
        }
        .padding()
        .background(.white)
        .clipShape(.rect(cornerRadius: 10))
    }
}

struct DeliveryOptionView: View{
    var body: some View{
        HStack{
            Image("Option1")
                .resizable()
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                .frame(height: 130)
            Image("Option2")
                .resizable()
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                .frame(height: 130)
            Image("Option3")
                .resizable()
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                .frame(height: 130)
        }
    }
}

struct CouponView: View{
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
        .overlay(RoundedRectangle(cornerRadius: 10).stroke(AngularGradient(gradient: /*@START_MENU_TOKEN@*/Gradient(colors: [Color.red, Color.blue])/*@END_MENU_TOKEN@*/, center: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/),lineWidth: 1))
    }
}

#Preview {
    BodyView()
}
