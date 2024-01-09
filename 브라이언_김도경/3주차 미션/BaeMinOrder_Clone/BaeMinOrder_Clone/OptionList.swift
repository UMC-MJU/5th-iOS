//
//  OptionList.swift
//  BaeMinOrder_Clone
//
//  Created by 김도경 on 10/9/23.
//

import UIKit

class OptionList: UIView {
    var isSelected : Bool = false {
        didSet {
            if isSelected == true {
                self.button.setImage(UIImage(named: "radio_on"), for: .normal)
            } else {
                self.button.setImage(UIImage(named: "radio_off"), for: .normal)
            }
        }
    }
    
    
    let button = {
        let button = UIButton()
        button.tintColor = .systemMint
        return button
    }()
    
    let optionName = {
        let optionName = UILabel()
        optionName.font = .systemFont(ofSize: 20,weight: .light)
        return optionName
    }()
    
    let optionPrice = {
        let optionPrice = UILabel()
        optionPrice.font = .systemFont(ofSize: 20, weight: .light)
        return optionPrice
    }()
    
    func setOptionList(_ type : Int, optionName : String, optionPrice : Int) {
        addViews()
        setConst()
        
        if type == 1 {
            isSelected = true
        } else {
            isSelected = false
        }
        self.optionName.text = optionName
        self.optionPrice.text = OptionList.toWon(optionPrice)
        self.backgroundColor = .white
    }
    
    private func addViews(){
        self.addSubview(button)
        self.addSubview(optionName)
        self.addSubview(optionPrice)
    }
    
    private func setConst(){
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        button.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        button.heightAnchor.constraint(equalToConstant: 30).isActive = true
        button.widthAnchor.constraint(equalToConstant: 30).isActive = true
        
        
        optionName.translatesAutoresizingMaskIntoConstraints = false
        optionName.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        optionName.leadingAnchor.constraint(equalTo: button.trailingAnchor, constant: 10).isActive = true
        
        optionPrice.translatesAutoresizingMaskIntoConstraints = false
        optionPrice.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        optionPrice.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension OptionList{
   static func toWon(_ num : Int) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal

        guard let result = numberFormatter.string(from: NSNumber(value: num)) else { return ""}
        
        return result + "원"
    }
    
    
}
