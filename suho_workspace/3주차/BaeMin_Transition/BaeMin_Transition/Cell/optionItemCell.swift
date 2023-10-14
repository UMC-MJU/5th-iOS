//
//  TableViewCell.swift
//  BaeMin_Transition
//
//  Created by 배수호 on 10/13/23.
//

import UIKit

class optionItemCell: UITableViewCell {

    static let cellID = "cellID3"
    let clickBtn = UIButton()
    let option = UILabel()
    let cost = UILabel()
    var checked = true
    
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
        clickBtn.translatesAutoresizingMaskIntoConstraints = false
        option.translatesAutoresizingMaskIntoConstraints = false
        cost.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        self.addSubview(clickBtn)
        self.addSubview(option)
        self.addSubview(cost)
        
        clickBtn.setImage(UIImage(named: "clicked_btn"), for: .normal)
        clickBtn.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        clickBtn.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15).isActive = true
        clickBtn.heightAnchor.constraint(equalToConstant: 25).isActive = true
        clickBtn.widthAnchor.constraint(equalToConstant: 25).isActive = true
        option.text = "M"
        cost.text = "20,000원"
      
        option.leadingAnchor.constraint(equalTo: clickBtn.trailingAnchor, constant: 10).isActive = true
        option.centerYAnchor.constraint(equalTo: clickBtn.centerYAnchor).isActive = true
        cost.centerYAnchor.constraint(equalTo: clickBtn.centerYAnchor).isActive = true
        cost.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -15).isActive = true
           
        
    }
    
}
