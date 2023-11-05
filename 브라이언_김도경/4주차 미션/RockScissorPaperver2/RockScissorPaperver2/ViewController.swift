//
//  ViewController.swift
//  RockScissorPaperver2
//
//  Created by 김도경 on 11/5/23.
//

import UIKit

class ViewController: UIViewController {
    
    let handData : [InputState] = [.rock,.scissors,.paper]
    
    enum InputState : String {
        case rock
        case scissors
        case paper
    }
   
    lazy var playStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var  computerImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "rock"))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var  myImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "rock"))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var gameResultLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "결과는?"
        return label
    }()
    
    lazy var playerLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "player?"
        return label
    }()
    
    lazy var comLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Com?"
        return label
    }()
    
    lazy var scissorsButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("가위", for: .normal)
        button.backgroundColor = .purple
        button.layer.cornerRadius = 20
        return button
    }()
    
    lazy var rockButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("바위", for: .normal)
        button.backgroundColor = .purple
        button.layer.cornerRadius = 20
        return button
    }()
    
    lazy var paperButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("보", for: .normal)
        button.backgroundColor = .purple
        button.layer.cornerRadius = 20
        return button
    }()

    lazy var inputStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        
        view.addSubview(playStackView)
        playStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        playStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        playStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        playStackView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        
        playStackView.addArrangedSubview(computerImageView)
        playStackView.addArrangedSubview(myImageView)
        
        
        view.addSubview(gameResultLabel)
        gameResultLabel.topAnchor.constraint(equalTo: playStackView.bottomAnchor).isActive = true
        gameResultLabel.centerXAnchor.constraint(equalTo: playStackView.centerXAnchor).isActive = true
        
        view.addSubview(comLabel)
        comLabel.bottomAnchor.constraint(equalTo: playStackView.topAnchor, constant: 40).isActive = true
        comLabel.leadingAnchor.constraint(equalTo: playStackView.leadingAnchor, constant: 30).isActive = true
        
        view.addSubview(playerLabel)
        playerLabel.bottomAnchor.constraint(equalTo: playStackView.topAnchor, constant: 40).isActive = true
        playerLabel.trailingAnchor.constraint(equalTo: playStackView.trailingAnchor, constant: -30).isActive = true
        
        view.addSubview(inputStackView)
        inputStackView.translatesAutoresizingMaskIntoConstraints = false
        inputStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        inputStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        inputStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -200).isActive = true
        inputStackView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        inputStackView.addArrangedSubview(rockButton)
        inputStackView.addArrangedSubview(scissorsButton)
        inputStackView.addArrangedSubview(paperButton)
        
        rockButton.addTarget(self, action: #selector(didTapChangeButton), for: .touchUpInside)
        scissorsButton.addTarget(self, action: #selector(didTapChangeButton1), for: .touchUpInside)
        paperButton.addTarget(self, action: #selector(didTapChangeButton2), for: .touchUpInside)
    }
    
    @objc func didTapChangeButton(){
        myImageView.image = UIImage(named: "rock")
        let randomInput = handData.randomElement()!
        computerImageView.image = UIImage(named: randomInput.rawValue)
        gameResultLabel.text = fetchGameResult(myInput: .rock, comInput: randomInput)
    }
    
    @objc func didTapChangeButton1(){
        myImageView.image = UIImage(named: "scissors")
        let randomInput = handData.randomElement()!
        computerImageView.image = UIImage(named: randomInput.rawValue)
        gameResultLabel.text = fetchGameResult(myInput: .scissors, comInput: randomInput)
    }

    
    @objc func didTapChangeButton2(){
        myImageView.image = UIImage(named: "paper")
        let randomInput = handData.randomElement()!
        computerImageView.image = UIImage(named: randomInput.rawValue)
        gameResultLabel.text = fetchGameResult(myInput: .paper, comInput: randomInput)
    }
    
    private func fetchGameResult(myInput : InputState, comInput  : InputState) -> String {
        switch myInput {
        case .scissors:
            switch comInput {
            case .scissors :
                return "비김"
            case .paper :
                return "이김"
            case .rock :
                return "짐"
            }
        case .rock:
            switch comInput {
            case .scissors :
                return "이김"
            case .paper :
                return "짐"
            case .rock :
                return "비김"
            }
        case .paper:
            switch comInput {
            case .scissors :
                return "짐"
            case .paper :
                return "비김"
            case .rock :
                return "이김"
            }
        }
    }


}

