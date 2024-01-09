//
//  ViewController.swift
//  DicePlay
//
//  Created by 김도경 on 10/6/23.
//

import UIKit

class ViewController: UIViewController {
    
    let diceimageNameData = ["one","two","three","four","five","six"]
    
    lazy var doubleLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "주사위를 굴려주세요"
        return label
    }()
    
    lazy var playStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var  diceImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "one"))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var  secondDiceImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "one"))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var changeButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("변경", for: .normal)
        button.backgroundColor = .purple
        button.layer.cornerRadius = 20
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        
        view.addSubview(playStackView)
        playStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        playStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        playStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        playStackView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        
        playStackView.addArrangedSubview(diceImageView)
        playStackView.addArrangedSubview(secondDiceImageView)
        
        view.addSubview(doubleLabel)
        doubleLabel.topAnchor.constraint(equalTo: playStackView.bottomAnchor, constant: 30).isActive = true
        doubleLabel.centerXAnchor.constraint(equalTo: playStackView.centerXAnchor).isActive = true
        
        view.addSubview(changeButton)
        changeButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        changeButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        changeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        changeButton.topAnchor.constraint(equalTo: view.bottomAnchor, constant: -100).isActive = true
        
        changeButton.addTarget(self, action: #selector(didTapChangeDiceImageButton), for: .touchUpInside)
    }
    
    @objc func didTapChangeDiceImageButton(){
        let firstDice = diceimageNameData.randomElement() ?? "one"
        let secondDice = diceimageNameData.randomElement() ?? "one"
        diceImageView.image = UIImage(named: firstDice)
        secondDiceImageView.image = UIImage(named: secondDice)
        
        if firstDice == secondDice {
            doubleLabel.text = "더블!"
        } else {
            doubleLabel.text = "다시 굴려주세요"
        }
        
    }


}

