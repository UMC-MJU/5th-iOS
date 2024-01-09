//
//  CustomCollectionViewCell.swift
//  Carrot_clone
//
//  Created by 김도경 on 10/6/23.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    let pic = UIImageView()
    
    static let cellId = "CellId"
    
    
    var isReserved : Bool = true
    
    let title : UILabel = {
        let title = UILabel()
        title.font = UIFont.systemFont(ofSize: 18, weight: .light)
        title.numberOfLines = 0
        title.sizeToFit()
        return title
    }()
    
    let locText : UILabel = {
        let locText = UILabel()
        locText.font = UIFont.systemFont(ofSize: 15)
        locText.textColor = .gray
        return locText
    }()
    
    let price : UILabel = {
        let price = UILabel()
        price.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return price
    }()
    let reserved : PaddingLabel = {
        let reserved = PaddingLabel()
        reserved.text = "예약중"
        reserved.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        reserved.textColor = .white
        reserved.backgroundColor = UIColor(cgColor: CGColor(red: 2/255, green: 113/255, blue: 72/255, alpha: 1))
        reserved.clipsToBounds = true
        reserved.layer.cornerRadius = 5
        return reserved
    }()
    
    let underLine : UIView = {
        let underLine = UIView()
        underLine.backgroundColor = .lightGray
        return underLine
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
        self.addSubview(locText)
        self.addSubview(price)
        self.addSubview(reserved)
        self.addSubview(underLine)
    }
    
    private func setConst(){
        //Pic
        pic.translatesAutoresizingMaskIntoConstraints = false
        pic.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15).isActive = true
        pic.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        pic.widthAnchor.constraint(equalToConstant: 120).isActive = true
        pic.heightAnchor.constraint(equalToConstant: 120).isActive = true
        
        //Title
        title.translatesAutoresizingMaskIntoConstraints = false
        title.leadingAnchor.constraint(equalTo: pic.trailingAnchor, constant: 15).isActive = true
        title.topAnchor.constraint(equalTo: pic.topAnchor, constant: 5).isActive = true
        title.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15).isActive = true
        
        //locText
        locText.translatesAutoresizingMaskIntoConstraints = false
        locText.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 10).isActive = true
        locText.leadingAnchor.constraint(equalTo: pic.trailingAnchor, constant: 15).isActive = true
        locText.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15).isActive = true
        
        //price
        price.translatesAutoresizingMaskIntoConstraints = false
        price.topAnchor.constraint(equalTo: locText.bottomAnchor, constant: 10).isActive = true
        price.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15).isActive = true
        
        
        //reserved
        if isReserved {
            //예약중이라면 예약중 표시
            print("IsReserved")
            reserved.translatesAutoresizingMaskIntoConstraints = false
            reserved.centerYAnchor.constraint(equalTo: price.centerYAnchor).isActive = true
            reserved.leadingAnchor.constraint(equalTo: pic.trailingAnchor, constant: 15).isActive = true
            price.leadingAnchor.constraint(equalTo: reserved.trailingAnchor, constant: 5).isActive = true
        } else {
            //표시하지 않고 가격을 왼쪽으로 땡겨서 표시
            price.leadingAnchor.constraint(equalTo: pic.trailingAnchor, constant: 15).isActive = true
        }
        
        //underline
        underLine.translatesAutoresizingMaskIntoConstraints = false
        underLine.heightAnchor.constraint(equalToConstant: 1).isActive = true
        underLine.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15).isActive = true
        underLine.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15).isActive = true
        underLine.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
    }
    
}




class PaddingLabel: UILabel {
    private var padding = UIEdgeInsets(top: 5.0, left: 7.0, bottom: 5.0, right: 8.0)

    convenience init(padding: UIEdgeInsets) {
        self.init()
        self.padding = padding
    }

    override func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: padding))
    }

    override var intrinsicContentSize: CGSize {
        var contentSize = super.intrinsicContentSize
        contentSize.height += padding.top + padding.bottom
        contentSize.width += padding.left + padding.right

        return contentSize
    }
}
