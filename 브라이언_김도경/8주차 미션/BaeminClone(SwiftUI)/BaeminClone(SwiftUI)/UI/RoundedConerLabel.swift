//
//  RoundedConerLabel.swift
//  BaeminClone(SwiftUI)
//
//  Created by 김도경 on 12/1/23.
//

import Foundation
import SwiftUI

struct RoundedConerLabel : View {
    var text : String
    var backgroundColor : Color
    
    init(_ text: String, color : Color) {
        self.text = text
        self.backgroundColor = color
    }
    
    var body: some View {
        ZStack{
            Color(backgroundColor)
                .opacity(0.1)
                .frame(width: 35,height: 30)
                .clipShape(.rect(cornerRadius: 15))
            Text(text)
                .bold()
                .font(.system(size: 12))
                .foregroundStyle(.blue)
        }
    }
}
