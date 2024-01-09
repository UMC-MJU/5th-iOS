//
//  ViewController.swift
//  BaeMinOrder_Clone
//
//  Created by 김도경 on 10/9/23.
//

import UIKit

class ViewController: UIViewController {
    
    var price = 20000 {
        didSet{
            navbar.button.setTitle(OptionList.toWon(price), for: .normal)
        }
    }
    let screenWidth = UIScreen.main.bounds.width
    let topbar = myTopBar()
    let navbar = myNavBar()
    let mainPic = {
        let pic = UIImageView()
        pic.image = UIImage(named: "pizza")
        pic.backgroundColor = .white
        return pic
    }()
    let titleView = myTilte()
    let priceView = PriceView()
    let doughView = DoughView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .secondarySystemBackground
        doughView.option.button.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
        priceView.option1.button.addTarget(self, action: #selector(buttonClickedOption1), for: .touchUpInside)
        priceView.option2.button.addTarget(self, action: #selector(buttonClickedOption2), for: .touchUpInside)
        navbar.button.addTarget(self, action: #selector(nextPage), for: .touchUpInside)
        addViews()
        setConst()
    }
    

    private func setConst() {
        topbar.translatesAutoresizingMaskIntoConstraints = false
        topbar.heightAnchor.constraint(equalToConstant: 50).isActive = true
        topbar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        topbar.widthAnchor.constraint(equalToConstant: screenWidth).isActive = true
        
        mainPic.translatesAutoresizingMaskIntoConstraints = false
        mainPic.topAnchor.constraint(equalTo: topbar.bottomAnchor).isActive = true
        mainPic.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        mainPic.widthAnchor.constraint(equalToConstant: screenWidth).isActive = true
        mainPic.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        titleView.translatesAutoresizingMaskIntoConstraints = false
        titleView.topAnchor.constraint(equalTo: mainPic.bottomAnchor, constant: -50).isActive = true
        titleView.widthAnchor.constraint(equalToConstant: screenWidth).isActive = true
        titleView.heightAnchor.constraint(equalToConstant: 170).isActive = true
        
        priceView.translatesAutoresizingMaskIntoConstraints = false
        priceView.topAnchor.constraint(equalTo: titleView.bottomAnchor, constant: 15).isActive = true
        priceView.widthAnchor.constraint(equalToConstant: screenWidth).isActive = true
        priceView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        doughView.translatesAutoresizingMaskIntoConstraints = false
        doughView.topAnchor.constraint(equalTo: priceView.bottomAnchor, constant: 15).isActive = true
        doughView.widthAnchor.constraint(equalToConstant: screenWidth).isActive = true
        doughView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        navbar.translatesAutoresizingMaskIntoConstraints = false
        navbar.widthAnchor.constraint(equalToConstant: screenWidth).isActive = true
        navbar.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
        navbar.heightAnchor.constraint(equalToConstant: 80).isActive = true
    }
    
    private func addViews(){
        view.addSubview(topbar)
        view.addSubview(mainPic)
        view.addSubview(titleView)
        view.addSubview(priceView)
        view.addSubview(doughView)
        view.addSubview(navbar)
    }
    
    @objc
    func buttonClicked(){
        if doughView.isSelected == false {
            price += 4500
        } else {
            price -= 4500
        }
        doughView.isSelected.toggle()
    }
    
    @objc
    func buttonClickedOption1(){
        if priceView.option1.isSelected == false {
            priceView.option2.isSelected.toggle()
            priceView.option1.isSelected.toggle()
            price -= 3000
        }
    }
    
    @objc
    func buttonClickedOption2 (){
        if priceView.option2.isSelected == false {
            priceView.option2.isSelected.toggle()
            priceView.option1.isSelected.toggle()
            price += 3000
        }
    }

}

//For Top and Bottom Bars
//MARK: - Components
extension ViewController {
    //MARK: - TopBar
    static private func myTopBar() -> UIView {
        let bar = UIView()
        let home = UIButton()
        let share = UIButton()
        let cart = UIButton()
        
        
        //Style
        bar.backgroundColor = .systemMint
        
        home.setImage(UIImage(systemName: "house"),for: .normal)
        home.tintColor = .white
        
        share.setImage(UIImage(systemName: "square.and.arrow.up"), for: .normal)
        share.tintColor = .white
        
        cart.setImage(UIImage(systemName: "cart"), for: .normal)
        cart.tintColor = .white
        
        //addingViews
        bar.addSubview(home)
        bar.addSubview(share)
        bar.addSubview(cart)
        
        
        //Constraint
        home.translatesAutoresizingMaskIntoConstraints = false
        home.centerYAnchor.constraint(equalTo: bar.centerYAnchor).isActive = true
        //home.widthAnchor.constraint(equalToConstant: 30).isActive = true
        //home.heightAnchor.constraint(equalToConstant: 25).isActive = true
        home.trailingAnchor.constraint(equalTo: share.leadingAnchor, constant: -15).isActive = true
        
        share.translatesAutoresizingMaskIntoConstraints = false
        share.centerYAnchor.constraint(equalTo: bar.centerYAnchor).isActive = true
        share.trailingAnchor.constraint(equalTo: cart.leadingAnchor, constant: -15).isActive = true
        
        cart.translatesAutoresizingMaskIntoConstraints = false
        cart.centerYAnchor.constraint(equalTo: bar.centerYAnchor).isActive = true
        cart.trailingAnchor.constraint(equalTo: bar.trailingAnchor, constant: -10).isActive = true
        
        return bar
    }
    //MARK: - Title
    static private func myTilte() -> UIView {
        let view = UIView()
        
        let pic = {
            let pic = UIImageView()
            pic.image = UIImage(named: "Favorite")
            return pic
        }()
        let title = {
            let title = UILabel()
            title.font = .systemFont(ofSize: 24,weight: .semibold)
            title.text = "[재주문1위] 바싹불고기피자"
            return title
        }()
        
        let subTitle = {
            let subTitle = UILabel()
            subTitle.font = .systemFont(ofSize: 18, weight: .light)
            subTitle.text = "바싹 익힌 불고기의 풍미를 입안 가득 느낄 수 있는 자가제빵선명희피자의 야심작"
            subTitle.textColor = .gray
            subTitle.numberOfLines = 0
            subTitle.sizeToFit()
            return subTitle
        }()
        
        let info = {
            let info = UIButton()
            info.setTitle("영양성분 및 알레르기성분 표시 보기", for: .normal)
            info.titleLabel?.font = .systemFont(ofSize: 12, weight: .light)
            info.setTitleColor(.black, for: .normal)
            info.backgroundColor = .secondarySystemBackground
            info.widthAnchor.constraint(equalToConstant: 180).isActive = true
            info.layer.cornerRadius = 10
            return info
        }()
        
        view.backgroundColor = .white
        view.addSubview(title)
        view.addSubview(subTitle)
        view.addSubview(info)
        view.addSubview(pic)
        
        pic.translatesAutoresizingMaskIntoConstraints = false
        pic.topAnchor.constraint(equalTo: view.topAnchor, constant: 15).isActive = true
        pic.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25).isActive = true
        pic.heightAnchor.constraint(equalToConstant: 40).isActive = true
        pic.widthAnchor.constraint(equalToConstant: 40).isActive = true
        
        title.translatesAutoresizingMaskIntoConstraints = false
        title.centerYAnchor.constraint(equalTo: pic.centerYAnchor).isActive = true
        title.leadingAnchor.constraint(equalTo: pic.trailingAnchor, constant: 5).isActive = true
        
        
        subTitle.translatesAutoresizingMaskIntoConstraints = false
        subTitle.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 20).isActive = true
        subTitle.leadingAnchor.constraint(equalTo: pic.leadingAnchor).isActive = true
        subTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5).isActive = true
        
        
        info.translatesAutoresizingMaskIntoConstraints = false
        info.topAnchor.constraint(equalTo: subTitle.bottomAnchor, constant: 10).isActive = true
        info.leadingAnchor.constraint(equalTo: pic.leadingAnchor).isActive = true
        info.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -15).isActive = true
        
        return view
    }
    
    
    //Button action
    @objc
    func nextPage() {
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "CartViewController") as? CartViewController else { return }
        vc.data = price
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

//MARK: - NavBar
class myNavBar : UIView {
    let bar = UIView()
    let button = UIButton()
    let minPriceText = UILabel()
    let priceText = UILabel()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setBar()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //Style
    private func setBar(){
        button.setTitle("20,000원", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        button.backgroundColor = .systemMint
        button.layer.cornerRadius = 5
        
        
        minPriceText.font = .systemFont(ofSize: 12, weight: .ultraLight)
        minPriceText.text = "배달최소주문금액"
        
        priceText.font = .systemFont(ofSize: 15)
        priceText.text = "16,000원"
        
        //addingViews
        self.addSubview(button)
        self.addSubview(minPriceText)
        self.addSubview(priceText)
        
        //Constraints
        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraint(equalToConstant: 265).isActive = true
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        button.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
        
        minPriceText.translatesAutoresizingMaskIntoConstraints = false
        minPriceText.topAnchor.constraint(equalTo: button.topAnchor, constant: 5).isActive = true
        minPriceText.trailingAnchor.constraint(equalTo: button.leadingAnchor, constant: -15).isActive = true
        
        
        priceText.translatesAutoresizingMaskIntoConstraints = false
        priceText.topAnchor.constraint(equalTo: minPriceText.bottomAnchor, constant: 5).isActive = true
        priceText.leadingAnchor.constraint(equalTo: minPriceText.leadingAnchor).isActive = true
    }
}

