//
//  OrderSelectionView.swift
//  BaeminClone(SwiftUI)
//
//  Created by 김도경 on 11/27/23.
//

import SwiftUI

struct OrderSelectionView: View {
    var body: some View {
        NavigationStack(){
            //topBar()
            List{
                pizza()
                    .listRowSeparator(.hidden)
                pizzaName()
                    .listRowSeparator(.hidden)
                priceView()
                    .listRowSeparator(.hidden)
                doughView()
                    .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
            .listRowSpacing(17)
            .background(Color(.secondarySystemBackground))
            bottomBar()
        }//Navigation
    }
}

struct bottomBar : View {
    @State var totalPrice : Int = 20000
    var body: some View {
        HStack{
            VStack(alignment:.leading){
                Text("배달최소주문금액")
                    .font(.system(size: 13))
                    .foregroundStyle(.gray)
                    .padding(.bottom,1)
                Text("17,000원")
                    .font(.system(size: 15))
            }
            NavigationLink(destination:CartView()){
                Button(action: {
                    
                }, label: {
                    ZStack{
                        Color(.mint)
                            .frame(maxWidth:260,maxHeight: 45)
                            .clipShape(.rect(cornerRadius: 5))
                        Text(OrderSelectionView.toWon(totalPrice) + " 담기")
                            .foregroundStyle(.white)
                            .bold()
                    }
                })
                
            }
        }
    }
}




struct pizza : View {
    var body: some View {
        Image("pizza")
            .resizable()
            .scaledToFill()
            .frame(width: .infinity, height: 100)
    }
}

struct pizzaName: View {
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                Image("favorite")
                    .resizable()
                    .frame(width: 40,height: 40)
                Text("[재주문1위] 바싹불고기피자")
                    .font(.system(size: 27))
                    .bold()
            }
            Text("바싹 익힌 불고기의 풍미를 입안 가득 느낄 수 있는 자가제빵선명희피자의 야심작")
                .fontWeight(.light)
                .foregroundStyle(.gray)
            ZStack{
                Color(.secondarySystemBackground)
                    .clipShape(.rect(cornerRadius: 10))
                    .frame(width: 190,height: 20)
                Text("영양성분 및 알레르기성분 표시 보기 ")
                    .font(.caption)
            }
        }
    }
}


extension OrderSelectionView {
   static func toWon(_ num : Int) -> String {
         let numberFormatter = NumberFormatter()
         numberFormatter.numberStyle = .decimal

         guard let result = numberFormatter.string(from: NSNumber(value: num)) else { return ""}
         
         return result + "원"
     }
}

#Preview {
    OrderSelectionView()
}
