//
//  KakaoLogin_SwiftUI_App.swift
//  KakaoLogin(SwiftUI)
//
//  Created by 김도경 on 12/7/23.
//

import SwiftUI
import KakaoSDKCommon
import KakaoSDKAuth


@main
struct KakaoLogin_SwiftUI_App: App {
    
    init(){
        KakaoSDK.initSDK(appKey: "7a8b4c634d9c0ab4fe656f502e5c3cd2")
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView().onOpenURL(perform: { url in
                            if (AuthApi.isKakaoTalkLoginUrl(url)) {
                                AuthController.handleOpenUrl(url: url)
                            }
                        })
        }
    }
}
