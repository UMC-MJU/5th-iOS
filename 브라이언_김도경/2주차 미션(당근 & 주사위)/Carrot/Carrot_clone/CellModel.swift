//
//  CellModel.swift
//  Carrot_clone
//
//  Created by 김도경 on 10/6/23.
//

import Foundation

class CellModel {
    let imageName : String
    let title : String
    let location : String
    let price : Int
    var isReserved : Bool
    
    init(imageName: String, title: String, location: String, price: Int, isReserved: Bool) {
        self.imageName = imageName
        self.title = title
        self.location = location
        self.price = price
        self.isReserved = isReserved
    }
    
    
    // 랜덤 데이터 생성 함수
  
}
func generateRandomData() -> [CellModel] {
    let titles = ["아이폰 XS 팝니다~", "맥북 프로 팝니다~", "갤럭시 S10 팝니다~", "아이패드 에어 팝니다~", "애플 워치 팝니다~"]
    let locations = ["서울 강남구", "부산 해운대구", "대구 중구", "인천 남동구", "광주 서구", "대전 유성구", "울산 남구"]
    
    var cellModels = [CellModel]()
    
    for _ in 1...10 {
        let randomLocation = locations.randomElement() ?? ""
        let randomPrice = Int.random(in: 50000...1000000) // 가격 범위 수정
        let randomIsReserved = Bool.random() // 랜덤으로 isReserved 설정
        
        let cellModel = CellModel(imageName: "AirpodMax", title: titles.randomElement() ?? "", location: randomLocation, price: randomPrice, isReserved: randomIsReserved)
        
        cellModels.append(cellModel)
    }
    
    return cellModels
}
