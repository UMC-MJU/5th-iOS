//
//  MenuSelectViewModel.swift
//  BaeminClone(SwiftUI)
//
//  Created by 김도경 on 12/2/23.
//

import Foundation


class MenuSelectViewModel : ObservableObject {
    var menu = Menu(title: "[재주문1위] 바싹불고기피자", description: "바싹 익힌 불고기의 풍미를 입안 가득 느낄 수 있는 자가제빵선명희피자의 야심작")
    
    var normalOptions : [Option] = [Option(isSelected: false, title: "크림리치고르 크러스트", price: 4500)]
    
    var requiredOptions : [Option] = [
        Option(isSelected: true, title: "M", price: 20000),
        Option(isSelected: false, title: "L", price: 23000)
    ]
    
    func requiredOptionSelected(_ selected: Int){
        requiredOptions[selected].isSelected = true
        for index in 0..<requiredOptions.count {
            if requiredOptions[index] != requiredOptions[selected] {
                requiredOptions[index].toFalse()
            }
        }
    
    }
    
}
