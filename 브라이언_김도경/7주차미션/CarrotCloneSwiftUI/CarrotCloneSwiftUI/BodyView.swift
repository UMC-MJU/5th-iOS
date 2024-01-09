//
//  BodyView.swift
//  CarrotCloneSwiftUI
//
//  Created by 김도경 on 11/19/23.
//

import SwiftUI

struct BodyView: View {
    var picList = ["airpod","airpod_gray","airpod_black","fry","ice"]
    let titleList =  ["안녕하세요. 에어팟 맥스 팝니다.", "특가~~ 싸게 팝니다","이번주에 쿠팡으로 산 미개봉 신품입니다", "한번 착용한 에어팟 맥스 팝니다. 쿨거래시 만원 할인 해드립니다." ,"에어팟 맥스 문고리 거래 합니다~~"]
    let locationList = ["서울시 양천구 목동", "서울시 구로구 신도림동","서울시 강서구 화곡동","서울시 양천구 신정3동","서울시 구로구 구로동", "서울시 강서구 화곡2동"]
    let dateList = ["3시간 전", "하루 전", "3일전","방금","4시간 전", "1시간 전"]
 
    var body: some View {
        List(0..<15){ i in
            if i == 0 || i == 5{
                ListCell(cellInfo: cellInfo(picName: "advertisePic",
                                            title: "[급구] 50만원 제공! 쿵야 레스토랑에서 시식 알바 구합니다.",
                                            location: "당근알바",
                                            date: "이벤트",
                                            price: 10000,
                                            isAdvertise: true
                                           ))
            } else if i % 3 == 0 {
                ListCell(cellInfo: cellInfo(picName: picList[Int.random(in: 0...2)],
                                            title: titleList[i % titleList.count],
                                            location: locationList[i % locationList.count],
                                            date: dateList[i % dateList.count],
                                            price: Int.random(in: 10000...100000),
                                            isReserved: true
                                           ))
            } else if i == 2 {
                VStack(alignment:.leading){
                    HStack{
                        Text("오오오 특가 이벤트")
                            .font(.system(size: 20))
                            .bold()
                        Spacer()
                        Text(">")
                            .font(.system(size: 20))
                            .bold()
                    }
                    .padding(.top,3)
                    ScrollView(.horizontal){
                        LazyHStack{
                            ForEach(0..<10){ i in
                                HstackCell(cellInfo: cellInfo(picName: picList[Int.random(in: 0..<picList.count)],
                                                              title: titleList[i % titleList.count],
                                                              location: locationList[i % locationList.count],
                                                              date: dateList[i % dateList.count],
                                                              price: Int.random(in: 10000...100000)
                                                             ))
                            }
                        }
                    }
                    .scrollIndicators(.hidden)
                }
            } else {
                ListCell(cellInfo: cellInfo(picName: picList[Int.random(in: 0...2)],
                                            title: titleList[i % titleList.count],
                                            location: locationList[i % locationList.count],
                                            date: dateList[i % dateList.count],
                                            price: Int.random(in: 10000...100000)
                                           ))
            }
        }
        .listStyle(.plain)
    }
}

struct cellInfo : Identifiable {
    var id = UUID()
    var picName : String = "airpod"
    var title : String = ""
    var location : String = ""
    var date : String = ""
    var price : Int = 0
    var priceText = "10,000원"
    var isReserved = false
    var isAdvertise = false
    
    init(id: UUID = UUID(), picName: String, title: String, location: String, date: String, price: Int, priceText: String = "10,000원", isReserved: Bool = false, isAdvertise: Bool = false) {
        self.id = id
        self.picName = picName
        self.title = title
        self.location = location
        self.date = date
        self.price = price
        self.priceText = {
            let numberFormatter: NumberFormatter = NumberFormatter()
            numberFormatter.numberStyle = .decimal
            let result: String = numberFormatter.string(for: price)!
            return result + "원"
        }()
        self.isReserved = isReserved
        self.isAdvertise = isAdvertise
    }
}

#Preview {
    BodyView()
}
