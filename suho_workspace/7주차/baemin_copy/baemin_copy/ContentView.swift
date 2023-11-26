//
//  ContentView.swift
//  baemin_copy
//
//  Created by 배수호 on 11/24/23.
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
