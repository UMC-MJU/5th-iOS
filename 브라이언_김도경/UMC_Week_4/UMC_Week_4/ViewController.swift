//
//  ViewController.swift
//  UMC_Week_4
//
//  Created by 김도경 on 10/30/23.
//

import UIKit
import SnapKit


class ViewController: UIViewController {
    
    var id = ""
    var pw = ""
    
    let defaults = UserDefaults.standard
    
    let topLabel = {
        let label = UILabel()
        label.text = "로그인"
        label.font = .systemFont(ofSize: 50, weight: .bold)
        return label
    }()
    let idField = {
        let field = UITextField()
        field.borderStyle = .roundedRect
        field.placeholder = "ID 입력"
        field.autocorrectionType = .no
        field.spellCheckingType = .no
        field.autocapitalizationType = .none
        return field
    }()
    let pwField = {
        let field = UITextField()
        field.borderStyle = .roundedRect
        field.placeholder = "비밀번호 입력"
        field.autocorrectionType = .no
        field.spellCheckingType = .no
        field.autocapitalizationType = .none
        return field
    }()
    
    let loginButton = {
        let button = UIButton()
        button.backgroundColor = .blue
        button.layer.cornerRadius = 15
        button.setTitle("로그인", for: .normal)
        return button
    }()
    
    let registerButton = {
        let button = UIButton()
        button.backgroundColor = .blue
        button.layer.cornerRadius = 15
        button.setTitle("회원가입", for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUP()
        setConst()
        loginButton.addTarget(self, action: #selector(loginButtonClicked), for: .touchUpInside)
        registerButton.addTarget(self, action: #selector(RegisterButtonClicked), for: .touchUpInside)
    }
    
    private func setUP(){
        view.addSubview(topLabel)
        view.addSubview(idField)
        view.addSubview(pwField)
        view.addSubview(loginButton)
        view.addSubview(registerButton)
    }
    
    private func setConst(){
        topLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(200)
            make.centerX.equalToSuperview()
        }
        idField.snp.makeConstraints { id in
            id.top.equalTo(topLabel.snp.bottom).inset(-30)
            id.centerX.equalTo(topLabel)
            id.width.equalTo(200)
        }
        pwField.snp.makeConstraints{ pw in
            pw.top.equalTo(idField.snp.bottom).inset(-10)
            pw.centerX.equalTo(topLabel)
            pw.width.equalTo(200)
        }
        loginButton.snp.makeConstraints { login in
            login.top.equalTo(pwField.snp.bottom).inset(-15)
            login.centerX.equalTo(topLabel)
            login.width.equalTo(200)
        }
        registerButton.snp.makeConstraints { register in
            register.top.equalTo(loginButton.snp.bottom).inset(-15)
            register.centerX.equalTo(topLabel)
            register.width.equalTo(200)
        }
    }
    @objc
    func loginButtonClicked(){
        self.id = idField.text!
        self.pw = pwField.text!
        
        if defaults.string(forKey: "ID") == idField.text! && defaults.string(forKey: "PW") == pwField.text! {
            topLabel.text = "로그인 성공!"
        } else {
            topLabel.text = "회원가입 하세요"
        }
    }
    
    @objc
    func RegisterButtonClicked(){
        self.id = idField.text!
        self.pw = pwField.text!
        
        if defaults.string(forKey: "ID") == idField.text! && defaults.string(forKey: "PW") == pwField.text! {
            topLabel.text = "이미 존재하는 ID"
        } else {
            defaults.set(id, forKey: "ID")
            defaults.set(pw, forKey: "PW")
            topLabel.text = "회원가입 완료!"
        }
    }
}

