//
//  ViewController.swift
//  BaeMin_Transition
//
//  Created by 배수호 on 10/9/23.
//

import UIKit

struct dataModel {
    var itemTitle: String = ""
    var itemOption: String = ""
    var itemCost: String = ""
    var OptionName: String = ""
    var image: UIImage = UIImage(named: "img_pizza") ?? UIImage()
}

var data = dataModel()

class ViewController: UIViewController {
    
   
    
    
    lazy var playTableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    
    lazy var bottomView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var orderButton: UIButton = {
        let button = UIButton()
        button.setTitle("20,000원 담기" , for: .normal)
        button.backgroundColor = .mainColor
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 5
        return button
    }()
    
    lazy var minmumLabel: UILabel = {
        let label = UILabel()
        label.text = "배달최소주문금액"
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 11)
        return label
    }()
    
    lazy var minmumPriceLabel: UILabel = {
        let label = UILabel()
        label.text = "17,000원"
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        playTableView.delegate = self
        playTableView.dataSource = self
        playTableView.register(mainImgCell.self, forCellReuseIdentifier: mainImgCell.cellID)
        playTableView.register(menuinfoCell.self, forCellReuseIdentifier: menuinfoCell.cellID)
        playTableView.register(optionCell.self, forCellReuseIdentifier: optionCell.cellID)
        playTableView.register(optionItemCell.self, forCellReuseIdentifier: optionItemCell.cellID)
        // 테이블뷰 추가 ( 스크롤 영역 )
        view.addSubview(playTableView)
        playTableView.topAnchor.constraint(equalTo: view.topAnchor, constant: -58).isActive = true
        playTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        playTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        playTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: -130).isActive = true
        
        //바텀뷰 추가
        view.addSubview(bottomView)
        bottomView.topAnchor.constraint(equalTo: playTableView.bottomAnchor
        ).isActive = true
        bottomView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        bottomView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        bottomView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        //order 버튼 추가
        bottomView.addSubview(orderButton)
        orderButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        orderButton.widthAnchor.constraint(equalTo: bottomView.widthAnchor, multiplier: 0.67).isActive = true
        orderButton.heightAnchor.constraint(equalTo: bottomView.heightAnchor, multiplier: 0.4).isActive = true
        orderButton.topAnchor.constraint(equalTo: bottomView.topAnchor, constant: 15).isActive = true
        orderButton.addTarget(self, action: #selector(didTapOrderButton), for:  .touchUpInside)
        
        //최소배달 금액 추가
        bottomView.addSubview(minmumLabel)
        bottomView.addSubview(minmumPriceLabel)
        minmumLabel.topAnchor.constraint(equalTo: bottomView.topAnchor, constant: 22).isActive = true
        minmumLabel.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor, constant: 15).isActive = true
        minmumPriceLabel.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor, constant: 15).isActive = true
        minmumPriceLabel.topAnchor.constraint(equalTo: minmumLabel.bottomAnchor, constant: 5).isActive = true
    }
    
    @objc func didTapOrderButton(){
        // 화면 전환
        let secondViewController = SecondViewController()
        self.navigationController?.pushViewController(secondViewController, animated: true)
        
        
        print("test")
        
    }

}
extension UIColor {
    class var mainColor: UIColor? { return UIColor(named: "mainColor") }
    class var lightGrayColor: UIColor? {return UIColor(named: "paleGray") }
}


class SecondViewController: UIViewController {
    
    lazy var backButton: UIButton = {
        let button = UIButton()
        button.setTitle("←", for: .normal)
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var bottomView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
  
    lazy var completeButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 5
        button.setTitle("배달 주문하기", for: .normal)
        button.backgroundColor = .mainColor
        return button
        
    }()
    
    let orderItemView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("changed")
        view.backgroundColor = .white
        view.addSubview(backButton)
        backButton.topAnchor.constraint(equalTo: view.topAnchor,constant: 45).isActive = true
        backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
        backButton.addTarget(self, action: #selector(didTapBackButton), for: .touchUpInside)
        
        //바텀뷰 추가
        view.addSubview(bottomView)
        bottomView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        bottomView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        bottomView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        bottomView.heightAnchor.constraint(equalToConstant: 130).isActive = true
        
        // completeButton 추가
        bottomView.addSubview(completeButton)
        completeButton.topAnchor.constraint(equalTo: bottomView.topAnchor, constant: 15).isActive = true
        completeButton.widthAnchor.constraint(equalTo: bottomView.widthAnchor, multiplier: 0.85).isActive = true
        completeButton.heightAnchor.constraint(equalTo: bottomView.heightAnchor, multiplier: 0.4).isActive = true
        completeButton.centerXAnchor.constraint(equalTo: bottomView.centerXAnchor).isActive = true
        
        //아이템 추가
        
        view.addSubview(orderItemView)
        orderItemView.heightAnchor.constraint(equalToConstant: 250).isActive = true
        orderItemView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        orderItemView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        orderItemView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        orderItemView.backgroundColor = .white
        orderItemView.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        optionLabel.translatesAutoresizingMaskIntoConstraints = false
        costLabel.translatesAutoresizingMaskIntoConstraints = false
        itemImage.translatesAutoresizingMaskIntoConstraints = false
        
        orderItemView.addSubview(titleLabel)
        orderItemView.addSubview(optionLabel)
        orderItemView.addSubview(costLabel)
        orderItemView.addSubview(itemImage)
        titleLabel.topAnchor.constraint(equalTo: orderItemView.topAnchor, constant: 40).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: orderItemView.leadingAnchor, constant: 15).isActive = true
        titleLabel.text = data.itemTitle
        titleLabel.font = UIFont.boldSystemFont(ofSize: 16)
        itemImage.image = data.image
        itemImage.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20).isActive = true
        itemImage.leadingAnchor.constraint(equalTo: orderItemView.leadingAnchor, constant: 15).isActive = true
        itemImage.heightAnchor.constraint(equalToConstant: 70).isActive  = true
        itemImage.widthAnchor.constraint(equalToConstant: 70).isActive = true
        optionLabel.text = "・ " + data.OptionName + data.itemOption
        optionLabel.textColor = .gray
        optionLabel.leadingAnchor.constraint(equalTo: itemImage.trailingAnchor, constant: 10).isActive = true
        optionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20).isActive = true
        costLabel.text = data.itemCost
        costLabel.leadingAnchor.constraint(equalTo: itemImage.trailingAnchor, constant: 14).isActive = true
        costLabel.topAnchor.constraint(equalTo: optionLabel.bottomAnchor, constant: 20).isActive = true
        print(data)
        
        
    }
    let titleLabel = UILabel()
    let optionLabel = UILabel()
    let costLabel = UILabel()
    let itemImage = UIImageView()
    
    @objc func didTapBackButton() {
        let mainViewController = ViewController()
        self.navigationController?.pushViewController(mainViewController, animated: true)
        
    }
 
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: mainImgCell.cellID, for: indexPath) as! mainImgCell
            cell.profile.image = UIImage(named: "img_pizza")
            cell.selectionStyle = .none
            data.image=cell.profile.image ?? UIImage()
            return cell
        }
        else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: menuinfoCell.cellID, for: indexPath) as! menuinfoCell
                cell.selectionStyle = .none
            data.itemTitle = cell.name.text ?? ""
            return cell
        }
        
        else if indexPath.row == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: optionCell.cellID, for: indexPath) as! optionCell
            data.OptionName = (cell.optionTitle.text ?? "" ) + " : "
            return cell
        }
        
        else if indexPath.row == 3{
            let cell = tableView.dequeueReusableCell(withIdentifier: optionItemCell.cellID, for: indexPath) as! optionItemCell
            data.itemOption = (cell.option.text ?? "") + " " + (cell.cost.text ?? "")
            data.itemCost = cell.cost.text ?? ""
            return cell
        }
        else if indexPath.row == 4{
            let cell = tableView.dequeueReusableCell(withIdentifier: optionItemCell.cellID, for: indexPath) as! optionItemCell
            cell.option.text = "L"
            cell.cost.text = "23,000원"
            cell.clickBtn.setImage(UIImage(named: "unchecked_btn"), for: .normal)
            cell.checked = false
            return cell
        }
        
        else{
            let cell = playTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as UITableViewCell
            cell.textLabel?.text = "a"
            return cell
        }
    }
  
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 3 {
            let cell = tableView.cellForRow(at: IndexPath(row:3, section: 0)) as? optionItemCell
            let cell2 = tableView.cellForRow(at: IndexPath(row:4, section: 0)) as? optionItemCell
            
            cell?.clickBtn.setImage(UIImage(named: "clicked_btn"), for: .normal)
            cell2?.clickBtn.setImage(UIImage(named: "unchecked_btn"), for: .normal)
            let str = cell?.cost.text ?? "20000원"
            let buttontitle = str + "담기"
            orderButton.setTitle(buttontitle, for: .normal)
            data.itemCost = cell?.cost.text ?? ""
            data.itemOption = (cell?.option.text ?? "") + " " + (cell?.cost.text ?? "")
        }
        else if indexPath.row == 4 {
            let cell = tableView.cellForRow(at: IndexPath(row:4, section: 0)) as? optionItemCell
            let cell2 = tableView.cellForRow(at: IndexPath(row:3, section: 0)) as? optionItemCell
            
            cell?.clickBtn.setImage(UIImage(named: "clicked_btn"), for: .normal)
            cell2?.clickBtn.setImage(UIImage(named: "unchecked_btn"), for: .normal)
            let str = cell?.cost.text ?? "23000원"
            let buttontitle = str + "담기"
            orderButton.setTitle(buttontitle, for: .normal)
            data.itemCost = cell?.cost.text ?? ""
            data.itemOption = (cell?.option.text ?? "") + " " + (cell?.cost.text ?? "")
        }
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
        
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0{
            return 250
        }
        else if indexPath.row == 1{
            return 150
        }
        else if indexPath.row == 2{
            return 70
        }
        else{
            return 55 // 원하는 셀 높이로 설정
        }
    }
}
