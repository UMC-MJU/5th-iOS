//
//  ViewController.swift
//  KakaoLogin
//
//  Created by 김도경 on 11/6/23.
//

import UIKit
import KakaoSDKCommon
import KakaoSDKAuth
import KakaoSDKUser

class ViewController: UIViewController {
    
    let button = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(UIImage(named: "kakao_login_medium_narrow"), for: .normal)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(button)
        
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        button.addTarget(self, action: #selector(clickedKakaoButton), for: .touchUpInside)
    }
    
    @objc
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

