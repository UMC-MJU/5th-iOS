//
//  PriceView.swift
//  BaeMinOrder_Clone
//
//  Created by 김도경 on 10/9/23.
//

import UIKit

class PriceView: UIView {
    
    var price = 20000
    
    let title = {
        let title = UILabel()
        title.font = .systemFont(ofSize: 23, weight: .semibold)
        title.text = "가격"
        return title
    }()
    
    let choiceType = {
        let button = UIButton()
        button.setTitle("필수", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 13, weight: .semibold)
        button.widthAnchor.constraint(equalToConstant: 40).isActive = true
        button.setTitleColor(.systemBlue, for: .normal)
        button.backgroundColor = UIColor(cgColor: CGColor(red: 100/255, green: 149/255, blue: 237/255, alpha: 0.4))
        button.layer.cornerRadius = 15

        return button
    }()
    
    let option1 = {
        let option = OptionList()
        option.setOptionList(1, optionName: "M", optionPrice: 20000)
        return option
    }()
    
    let option2 = {
        let option = OptionList()
        option.setOptionList(0, optionName: "L", optionPrice: 23000)
        return option
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        addViews()
        setConst()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addViews(){
        self.addSubview(title)
        self.addSubview(choiceType)
        self.addSubview(option1)
        self.addSubview(option2)
    }
    
    private func setConst(){
        title.translatesAutoresizingMaskIntoConstraints = false
        title.topAnchor.constraint(equalTo: self.topAnchor, constant: 15).isActive = true
        title.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 25).isActive = true
        
        choiceType.translatesAutoresizingMaskIntoConstraints = false
        choiceType.centerYAnchor.constraint(equalTo: title.centerYAnchor).isActive = true
        choiceType.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -25).isActive = true
        
        option1.translatesAutoresizingMaskIntoConstraints = false
        option1.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 10).isActive = true
        option1.leadingAnchor.constraint(equalTo: title.leadingAnchor).isActive = true
        option1.trailingAnchor.constraint(equalTo: choiceType.trailingAnchor).isActive = true
        option1.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        option2.translatesAutoresizingMaskIntoConstraints = false
        option2.topAnchor.constraint(equalTo: option1.bottomAnchor, constant: 30).isActive = true
        option2.leadingAnchor.constraint(equalTo: title.leadingAnchor).isActive = true
        option2.trailingAnchor.constraint(equalTo: choiceType.trailingAnchor).isActive = true
        option2.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
}

