//
//  HscrollViewCell.swift
//  Daangn_SwiftUI
//
//  Created by 배수호 on 11/26/23.
//

import SwiftUI

struct HscrollViewCell: View {
    var imagename:String = "h2"
    var context:String = "얼음 트레이 소 (얼음판)/개당 판매・・・"
    var price:String = "1,000원"
    var body: some View {
        
        VStack{
            Image(imagename)
                .resizable()
                .frame(width: 150,height: 160)
            Text(context)
                .frame(width: 170)
                .font(.system(size: 14))
            Text(price)
                .bold()
                .padding(.trailing,75)
            
        }
    }
}

#Preview {
    HscrollViewCell()
}
