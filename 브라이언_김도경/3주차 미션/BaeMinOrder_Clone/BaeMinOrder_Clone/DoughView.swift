//
//  DoughView.swift
//  BaeMinOrder_Clone
//
//  Created by 김도경 on 10/9/23.
//

import UIKit

class DoughView: UIView {
    
    var isSelected : Bool = false {
        didSet{
            if isSelected == false {
                option.button.setImage(UIImage(systemName: "square"), for: .normal)
            } else {
                option.button.setImage(UIImage(systemName: "square.inset.filled"), for: .normal)
            }
        }
    }

    let title = {
        let title = UILabel()
        title.font = .systemFont(ofSize: 23, weight: .semibold)
        title.text = "도우변경"
        return title
    }()
    
    let choiceType = {
        let button = UIButton()
        button.setTitle("선택", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 13, weight: .semibold)
        button.widthAnchor.constraint(equalToConstant: 40).isActive = true
        button.setTitleColor(.gray, for: .normal)
        button.backgroundColor = .secondarySystemBackground
        button.layer.cornerRadius = 15
        return button
    }()
    
    let subInfo = {
        let subInfo = UILabel()
        subInfo.text = "최대 1개 선택"
        subInfo.font = .systemFont(ofSize: 12)
        subInfo.textColor = .gray
        return subInfo
    }()
    
    let option = {
       let option = OptionList()
        option.setOptionList(0, optionName: "크림리치골드 크러스트", optionPrice: 4500)
        option.optionPrice.text = "+" + option.optionPrice.text!
        option.button.updateConstraints()
        option.button.tintColor = .gray
        return option
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        option.button.setImage(UIImage(systemName: "square"), for: .normal)
        //option.button.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
        addViews()
        setConst()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addViews(){
        self.addSubview(title)
        self.addSubview(choiceType)
        self.addSubview(subInfo)
        self.addSubview(option)
    }
    
    private func setConst(){
        title.translatesAutoresizingMaskIntoConstraints = false
        title.topAnchor.constraint(equalTo: self.topAnchor, constant: 15).isActive = true
        title.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 25).isActive = true
        
        choiceType.translatesAutoresizingMaskIntoConstraints = false
        choiceType.centerYAnchor.constraint(equalTo: title.centerYAnchor).isActive = true
        choiceType.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -25).isActive = true
        
        
        subInfo.translatesAutoresizingMaskIntoConstraints = false
        subInfo.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 10).isActive = true
        subInfo.leadingAnchor.constraint(equalTo: title.leadingAnchor).isActive = true
        
        
        option.translatesAutoresizingMaskIntoConstraints = false
        option.topAnchor.constraint(equalTo: subInfo.bottomAnchor, constant: 15).isActive = true
        option.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 25).isActive = true
        option.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -25).isActive = true
        option.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
  
    

}
