//
//  TableViewCell.swift
//  BaeMin_Transition
//
//  Created by 배수호 on 10/13/23.
//

import UIKit

class menuinfoCell: UITableViewCell {

    static let cellID = "cellID1"
    let name = UILabel()
    let info = UILabel()
    let nutrition = UILabel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func layout(){
        self.addSubview(name)
        self.addSubview(info)
        self.addSubview(nutrition)
        
        name.translatesAutoresizingMaskIntoConstraints = false
        info.translatesAutoresizingMaskIntoConstraints = false
        nutrition.translatesAutoresizingMaskIntoConstraints = false
        
        name.topAnchor.constraint(equalTo: self.topAnchor, constant: 20).isActive = true
        info.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 20).isActive = true
        nutrition.topAnchor.constraint(equalTo: info.bottomAnchor, constant: 10).isActive = true
        
        name.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15).isActive = true
        info.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15).isActive = true
        nutrition.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15).isActive = true
        
        name.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15).isActive = true
        info.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15).isActive = true
        
       
            name.text = "[재주문1위] 바싹불고기피자"
            name.backgroundColor = .white
            name.numberOfLines = 0
            name.font = UIFont.boldSystemFont(ofSize: 20)
        
            info.text = "바싹 익힌 불고기의 풍미를 입안 가득 느낄 수 있는 자가제빵선명희피자의 야심작"
            info.backgroundColor = .white
            info.textColor = .gray
            info.font = UIFont.systemFont(ofSize: 15)
            info.numberOfLines = 0
        
        nutrition.backgroundColor = .lightGrayColor
        nutrition.text = "영양성분 및 알레르기성분 표시 보기"
        nutrition.textColor = .black
        nutrition.font = UIFont.systemFont(ofSize: 11)
        nutrition.layer.cornerRadius = 5
        nutrition.layer.masksToBounds = true
    }
}
