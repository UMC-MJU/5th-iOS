//
//  SecondAppMainViewController.swift
//  PracticeUIKit01
//
//  Created by 배수호 on 9/28/23.
//

import UIKit

class SecondAppMainViewController: UIViewController {

    let diceImageNameData = ["dice-six-faces-one", "dice-six-faces-two", "dice-six-faces-three", "dice-six-faces-four", "dice-six-faces-five", "dice-six-faces-six"]
    
    lazy var diceImageView:UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "dice-six-faces-one"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var changeButton: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("변경해주세요", for: .normal)
        button.backgroundColor = .gray
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        view.addSubview(diceImageView)
        
        diceImageView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        diceImageView.widthAnchor.constraint(equalToConstant: 300).isActive = true
        diceImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        diceImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        view.addSubview(changeButton)
        
        changeButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        changeButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        changeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        changeButton.topAnchor.constraint(equalTo: diceImageView.bottomAnchor).isActive = true
        changeButton.addTarget(self, action: #selector(didTapChangeDiceImageButton), for:  .touchUpInside)
        
    }
    
    @objc func didTapChangeDiceImageButton(){
        diceImageView.image = UIImage(named: diceImageNameData.randomElement() ?? "dice-six-faces-one")
        diceImageView.image = UIImage(named: diceImageNameData.randomElement() ?? "dice-six-faces-one")
    }
}
