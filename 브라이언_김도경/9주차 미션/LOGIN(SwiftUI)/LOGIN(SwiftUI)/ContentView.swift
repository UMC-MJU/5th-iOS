//
//  ContentView.swift
//  LOGIN(SwiftUI)
//
//  Created by 김도경 on 12/3/23.
//

import SwiftUI

struct ContentView: View {
    @State var text : String = "안녕하세요"
    
    @State var ID : String = ""
    @State var pw : String = ""
    
    let defaults = UserDefaults.standard
    
    
    var body: some View {
        VStack {
            Text(text)
                .font(.largeTitle).bold()
            TextField("ID", text: $ID)
                .textFieldStyle(.roundedBorder)
            TextField("Password", text: $pw)
                .textFieldStyle(.roundedBorder)
                .textContentType(.password)
            
            Button("Login"){
                onLogin()
            }
            Button("Register"){
                onRegister()
            }
        }
        .padding()
    }
    
    func onLogin(){
        if ID == defaults.string(forKey: "ID") && pw == defaults.string(forKey: "PW"){
            text = "로그인 성공"
        } else if ID == defaults.string(forKey: "ID") && pw != defaults.string(forKey: "PW"){
            text = "비밀번호가 틀렸습니다."
        } else {
            text = "존재하지 않는 ID입니다"
        }
    }
    func onRegister(){
        if defaults.string(forKey: "ID") == ID {
            text = "이미 존재하는 ID 입니다"
        } else {
            defaults.setValue(ID, forKey: "ID")
            defaults.setValue(pw, forKey: "PW")
            text = "회원가입 성공"
        }
    }
}

#Preview {
    ContentView()
}
