//
//  CartViewController.swift
//  BaeMinOrder_Clone
//
//  Created by 김도경 on 10/9/23.
//

import UIKit

class CartViewController: UIViewController {
    
    var data = 0
    
    var store : [Int] = []
    
    let home = {
        let button = UIBarButtonItem()
        button.image = UIImage(systemName: "house")
        button.tintColor = .black
        return button
    }()
    
    let person = {
        let person = UIBarButtonItem()
        person.image = UIImage(systemName: "person.3.sequence")
        return person
    }()
    
    let deliveryView = setDelivery()
    
    let storeView = setStore()
    
    let stackView = UIStackView()
    
    
    
    let bottomButtom = bottomButton()
    
    let buttonView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "장바구니"
        self.view.backgroundColor = .secondarySystemBackground
        addViews()
        setConst()
        addOption()
    }
    
    
    private func addOption(){
        store.append(data)
        bottomButtom.changeCount(store.count)
        let option = createMenu(data)
        option.translatesAutoresizingMaskIntoConstraints = false
        option.layer.borderWidth = 0.5
        stackView.addArrangedSubview(option)
        bottomButtom.price.text = OptionList.toWon(data)
    }
    
    private func addViews(){
        self.navigationItem.rightBarButtonItems = [ person, home]
        view.addSubview(deliveryView)
        view.addSubview(storeView)
        view.addSubview(stackView)
        
        //Bottom
        buttonView.addSubview(bottomButtom)
        bottomButtom.translatesAutoresizingMaskIntoConstraints = false
        bottomButtom.heightAnchor.constraint(equalToConstant: 60).isActive = true
        bottomButtom.topAnchor.constraint(equalTo: buttonView.topAnchor, constant: 10).isActive = true
        bottomButtom.leadingAnchor.constraint(equalTo: buttonView.leadingAnchor, constant: 10).isActive = true
        bottomButtom.trailingAnchor.constraint(equalTo: buttonView.trailingAnchor, constant: -10).isActive = true
        
        view.addSubview(buttonView)
    }
    
    private func setConst(){
        deliveryView.translatesAutoresizingMaskIntoConstraints = false
        deliveryView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        deliveryView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        deliveryView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        deliveryView.heightAnchor.constraint(equalToConstant: 70).isActive = true

        
        storeView.translatesAutoresizingMaskIntoConstraints = false
        storeView.topAnchor.constraint(equalTo: deliveryView.bottomAnchor, constant: 20).isActive = true
        storeView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true
        storeView.heightAnchor.constraint(equalToConstant: 70).isActive = true

        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: storeView.bottomAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: buttonView.topAnchor).isActive = true
        stackView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true

        
        buttonView.translatesAutoresizingMaskIntoConstraints = false
        buttonView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        buttonView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        buttonView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        buttonView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
    }
}

extension CartViewController {
    
    private func createMenu(_ x : Int) -> UIView{
        let view = UIView()
        let title = UILabel()
        let pic = UIImageView()
        let option = UILabel()
        let price = UILabel()
        
        title.text = "[재주문1위] 바싹불고기피자"
        title.font = .systemFont(ofSize: 20, weight: .bold)
        
        pic.image = UIImage(named: "pizza")
        pic.layer.borderWidth = 1
        pic.layer.cornerRadius = 5
        
        option.text = x == 20000 || x == 24500 ? "가격 : M (20,000원)" : "가격 : L (23,000원)"
        option.font = .systemFont(ofSize: 15)
        option.textColor = .gray
        
        price.text = OptionList.toWon(x)
        price.font = .systemFont(ofSize: 18)
        
        view.addSubview(title)
        view.addSubview(pic)
        view.addSubview(option)
        view.addSubview(price)
        
        title.translatesAutoresizingMaskIntoConstraints = false
        title.topAnchor.constraint(equalTo: view.topAnchor, constant: 15).isActive = true
        title.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        
        pic.translatesAutoresizingMaskIntoConstraints = false
        pic.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 25).isActive = true
        pic.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        pic.heightAnchor.constraint(equalToConstant: 100).isActive = true
        pic.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        option.translatesAutoresizingMaskIntoConstraints = false
        option.leadingAnchor.constraint(equalTo: pic.trailingAnchor, constant: 10).isActive = true
        option.topAnchor.constraint(equalTo: pic.topAnchor,constant: 5).isActive = true
        
        price.translatesAutoresizingMaskIntoConstraints = false
        price.leadingAnchor.constraint(equalTo: pic.trailingAnchor,constant: 10).isActive = true
        price.topAnchor.constraint(equalTo: option.bottomAnchor,constant: 10).isActive = true
        
        return view
    }
    
    
    static private func setDelivery() -> UIView{
        let view = UIView()
        let type = UILabel()
        let subText = UILabel()
        
        view.addSubview(type)
        view.addSubview(subText)
        
        //Style
        type.font = .systemFont(ofSize: 25, weight: .bold)
        subText.font = .systemFont(ofSize: 20)
        
        //Text
        type.text = "배달"
        subText.text = "로 받을게요"
        
        //Constraints
        type.translatesAutoresizingMaskIntoConstraints = false
        type.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        type.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        
        subText.translatesAutoresizingMaskIntoConstraints = false
        subText.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        subText.leadingAnchor.constraint(equalTo: type.trailingAnchor, constant: 15).isActive = true
        
        return view
    }
    
    static private func setStore() -> UIView {
        let view = UIView()
        let pic = UIImageView()
        let storeName = UILabel()
        let timePic = UIImageView()
        let time = UILabel()
        
        view.addSubview(pic)
        view.addSubview(storeName)
        view.addSubview(timePic)
        view.addSubview(time)
        //Style
        pic.image = UIImage(named: "logo")
        
        storeName.font = .systemFont(ofSize: 17, weight: .bold)
        
        timePic.image = UIImage(systemName: "clock")
        timePic.tintColor = .black
        
        time.font = .systemFont(ofSize: 15)
        
        //Text
        storeName.text = "자가제빵 선명희피자 광명점"
        time.text = "41~56분 후 도착"
        
        //Constraints
        pic.translatesAutoresizingMaskIntoConstraints = false
        pic.widthAnchor.constraint(equalToConstant: 20).isActive = true
        pic.heightAnchor.constraint(equalToConstant: 20).isActive = true
        pic.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        pic.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        
        storeName.translatesAutoresizingMaskIntoConstraints = false
        storeName.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        storeName.leadingAnchor.constraint(equalTo: pic.trailingAnchor, constant: 5).isActive = true
        
        timePic.translatesAutoresizingMaskIntoConstraints = false
        timePic.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        timePic.leadingAnchor.constraint(equalTo: storeName.trailingAnchor, constant: 30).isActive = true
        
        time.translatesAutoresizingMaskIntoConstraints = false
        time.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        time.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        
        
        return view
    }
   
    
}

class bottomButton : UIView {
    let count = UILabel()
    let title = UILabel()
    let price = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
        setConst()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func changeCount(_ count : Int){
        self.count.text = String(count)
    }
    
    private func setConst(){
        //Style
        self.backgroundColor = .systemMint
        self.layer.cornerRadius = 5
        count.text = "2"
        count.backgroundColor = .white
        count.textAlignment = .center
        count.textColor = .systemMint
        count.layer.cornerRadius = 100
        
        title.text = "배달 주문하기"
        title.textColor = .white
        title.font = .systemFont(ofSize: 20, weight: .bold)
        
        price.textColor = .white
        price.font = .systemFont(ofSize: 15, weight: .bold)
        
        //Constraints
        count.translatesAutoresizingMaskIntoConstraints = false
        count.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        count.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        count.widthAnchor.constraint(equalToConstant: 30).isActive = true
        count.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        title.translatesAutoresizingMaskIntoConstraints = false
        title.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        title.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        
        price.translatesAutoresizingMaskIntoConstraints = false
        price.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        price.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
        
    }
    
    private func addViews(){
        self.addSubview(count)
        self.addSubview(title)
        self.addSubview(price)
    }
}
