//
//  CustomHoriontalCell.swift
//  Carrot_clone
//
//  Created by 김도경 on 10/6/23.
//

import UIKit

class CustomHoriontalCell: UICollectionViewCell {
    
    static let cellId = "HorizonCell"
    
    let pic = UIImageView()
    
    let title : UILabel = {
        let title = UILabel()
        title.font = UIFont.systemFont(ofSize: 16, weight: .light)
        title.numberOfLines = 0
        title.sizeToFit()
        return title
    }()
    
    let price : UILabel = {
        let price = UILabel()
        price.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return price
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
        setConst()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
     
    private func addViews(){
        self.addSubview(pic)
        self.addSubview(title)
        self.addSubview(price)
    }
    
    private func setConst(){
        //
        pic.translatesAutoresizingMaskIntoConstraints = false
        pic.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        pic.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15).isActive = true
        pic.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15).isActive = true
        
        //
        title.translatesAutoresizingMaskIntoConstraints = false
        title.topAnchor.constraint(equalTo: pic.bottomAnchor, constant: 10).isActive = true
        title.centerXAnchor.constraint(equalTo: pic.centerXAnchor).isActive = true
        
        //
        price.translatesAutoresizingMaskIntoConstraints = false
        price.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 10).isActive = true
        price.centerXAnchor.constraint(equalTo: pic.centerXAnchor).isActive = true
        
    }
    
}
