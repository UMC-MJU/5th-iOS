//
//  TableViewCell.swift
//  BaeMin_Transition
//
//  Created by 배수호 on 10/13/23.
//

import UIKit

class mainImgCell: UITableViewCell {

    static let cellID = "cellID"
    let profile = UIImageView()
    
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
        self.addSubview(profile)
        
        profile.translatesAutoresizingMaskIntoConstraints = false
        profile.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        profile.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        profile.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        profile.heightAnchor.constraint(equalToConstant: 250).isActive = true
        }
}
