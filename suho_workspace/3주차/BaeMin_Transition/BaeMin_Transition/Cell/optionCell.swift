//
//  TableViewCell.swift
//  BaeMin_Transition
//
//  Created by 배수호 on 10/13/23.
//

import UIKit

class optionCell: UITableViewCell {

    static let cellID = "cellID2"
    
    let optionTitle = UILabel()
    let optiontype = UILabel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
        
//        clickButton.isUserInteractionEnabled = true
//        clickButton2.isUserInteractionEnabled = true
//        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapCheckButton))
//        clickButton.addGestureRecognizer(tapGesture)
//        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            super.touchesBegan(touches, with: event)
            
            // 셀 터치 이벤트가 발생했을 때 실행할 코드를 여기에 추가합니다.
            print("셀이 터치되었습니다.")
        }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func layout(){
        self.addSubview(optionTitle)
        self.addSubview(optiontype)
       optionTitle.translatesAutoresizingMaskIntoConstraints = false
        optiontype.translatesAutoresizingMaskIntoConstraints = false
        
        optionTitle.topAnchor.constraint(equalTo: self.topAnchor, constant: 15).isActive = true
        optionTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15).isActive = true
        optiontype.centerYAnchor.constraint(equalTo: optionTitle.centerYAnchor).isActive = true
        optiontype.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15).isActive = true
        
        optionTitle.text = "가격"
        optionTitle.backgroundColor = .white
        optionTitle.font = UIFont.boldSystemFont(ofSize: 20)
        
        optiontype.text = "필수"
        optiontype.textColor = .systemBlue
        optiontype.font = UIFont.boldSystemFont(ofSize: 14)
        optiontype.backgroundColor = UIColor(named: "paleBlue")
        optiontype.layer.cornerRadius = 5
        optiontype.layer.masksToBounds = true
        
        
      
        }
    
}
