//
//  ContentView.swift
//  CarrotCloneSwiftUI
//
//  Created by 김도경 on 11/19/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            VStack {
                TopBar()
                BodyView()
            }
            .tabItem {
                Image(systemName: "house.fill")
                Text("홈")
                    .foregroundStyle(.black)
            }
            .toolbarBackground(
                    // 1
                    Color.white,
                    // 2
                    for: .tabBar)
            Text("")
                .tabItem {
                    Image(systemName: "newspaper")
                    Text("동네생활")
                }
            Text("")
                .tabItem {
                    Image(systemName: "mappin.circle")
                    Text("내 근처")
                }
            Text("")
                .tabItem {
                    Image(systemName: "message")
                    Text("채팅")
                }
            Text("")
                .tabItem {
                    Image(systemName: "person")
                    Text("나의 당근")
                }
        }
        .tint(.black)
    }
}

#Preview {
    ContentView()
}
