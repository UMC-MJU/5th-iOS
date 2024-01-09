//
//  ContentView.swift
//  KakaoLogin(SwiftUI)
//
//  Created by 김도경 on 12/7/23.
//

import SwiftUI
import KakaoSDKCommon
import KakaoSDKAuth
import KakaoSDKUser

struct ContentView: View {
    var body: some View {
        VStack {
            Button(action: {
                clickedKakaoButton()
            }, label: {
                Image("kakao_login_medium_narrow")
            })
        }
        .padding()
    }
    
    func clickedKakaoButton(){
        UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
                if let error = error {
                    print(error)
                }
                else {
                    print("loginWithKakaoAccount() success.")
                    //do something
                    print(oauthToken!)
                }
            }
    }
}

#Preview {
    ContentView()
}
