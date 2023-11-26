//
//  bodyView.swift
//  Daangn_SwiftUI
//
//  Created by 배수호 on 11/25/23.
//

import SwiftUI



struct bodyView: View {
    var body: some View{
        ScrollView{
            VStack{
                itemViewCell(imagename: "p1",context: "[급구] 50만원 제공! 쿵야 레스토랑에서 시식 알바 구합니다.^^-🧅", location: "당근알바 ・ 이벤트")
                Divider()
                itemViewCell(imagename: "p2", context: "에어팟맥스실버", location: "서울특별시 양천구 ・ 6일 전", price: "370,000원", state: 1,chatnum: 5, heartnum: 23)
                Divider()
                itemViewCell(imagename: "p3", context: "에어팟 맥스 스페이스그레이 S급 판매합니다.", location: "서울특별시 양천구 ・ 3시간 전", price: "490,000원",chatnum: 1, heartnum: 4)
                Divider()
                itemViewCell(imagename: "p4", context: "[S급]에어팟 맥스 스페이스 그레이 풀박 판매합니다.", location: "서울특별시 양천구 ・ 1일 전", price: "550,000원",state: 1,chatnum: 1, heartnum: 7)
                Divider()
                itemViewCell(imagename: "p5", context: "에어팟맥스 실버(미개봉)", location: "서울특별시 구로구 ・ 5시간 전", price: "600,000원", state: 2,chatnum: 4)
                Divider()
                VStack{
                    HStack{
                        Text("시원한 여름 간식의 계절🍉🍧🍦")
                            .bold()
                        Spacer()
                        Image(systemName: "chevron.right")
                    }
                    .padding()
                    ScrollView(.horizontal){
                        HStack{
                            HscrollViewCell(imagename: "h1", context: "키친플라워 DW1201CP 얼음 트레이・・・",price: "62,000원");
                            HscrollViewCell();
                            HscrollViewCell();
                        }
                    }
                }
                Divider()
                itemViewCell(imagename: "p6", context: "메가하이볼!!", location: "광명동 ・ 추천소식")
                Divider()
            }
        }
    }
}


#Preview {
    bodyView()
//    HScrollView()
}
