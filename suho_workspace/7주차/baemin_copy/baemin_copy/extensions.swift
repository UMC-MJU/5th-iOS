//
//  extensions.swift
//  baemin_copy
//
//  Created by 배수호 on 11/24/23.
//
import Foundation
import SwiftUI

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

extension View{
    func roundedCorner(_ radius: CGFloat, corners: UIRectCorner) -> some View{
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}


