//
//  ViewController.swift
//  PracticeUIKit01
//
//  Created by 배수호 on 2023/09/26.
//

import UIKit

class ViewController: UIViewController {

    lazy var myNameTextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "suho"
        label.textAlignment = .center
        label.backgroundColor = .white
        return label
    }()

    lazy var changeButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("인사해주세요", for: .normal)
        button.backgroundColor = .blue
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
        view.addSubview(myNameTextLabel)
        myNameTextLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        myNameTextLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        myNameTextLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        myNameTextLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        view.addSubview(changeButton)
        changeButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        changeButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        changeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        changeButton.topAnchor.constraint(equalTo: myNameTextLabel.bottomAnchor,constant:  200).isActive = true
        
        changeButton.addTarget(self, action: #selector(didTapChangeNameButton), for: .touchUpInside)
        
    }
    
    @objc func didTapChangeNameButton(){
        myNameTextLabel.text = "안녕하세요!"
    }
}

