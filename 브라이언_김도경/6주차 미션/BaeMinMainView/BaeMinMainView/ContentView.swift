//
//  ContentView.swift
//  BaeMinMainView
//
//  Created by 김도경 on 11/13/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            TopView()
            BodyView()
            TabBar()
        }
        .background(Color(.secondarySystemBackground))
    }
}

#Preview {
    ContentView()
}

