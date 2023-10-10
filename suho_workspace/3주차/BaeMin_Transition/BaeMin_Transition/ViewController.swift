//
//  ViewController.swift
//  BaeMin_Transition
//
//  Created by 배수호 on 10/9/23.
//

import UIKit

class ViewController: UIViewController {
    

    lazy var playStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.backgroundColor = .white
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 0
        return stackView
    }()
    
    lazy var mainView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .lightGrayColor
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    lazy var pizzaImage: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "img_pizza"))
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var menuNameLabel: UILabel = {
        let label = UILabel()
        label.text = "[재주문1위] 바싹불고기피자"
        label.backgroundColor = .white
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var menuInfoLabel: UILabel = {
        let label = UILabel()
        label.text = "바싹 익힌 불고기의 풍미를 입안 가득 느낄 수 있는 자가제빵선명희피자의 야심작"
        label.backgroundColor = .white
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
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
    
    lazy var infoView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var nutritionLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .lightGrayColor
        label.text = "영양성분 및 알레르기성분 표시 보기"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 11)
        label.layer.cornerRadius = 5
        label.layer.masksToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        //스크롤뷰 추가
        view.addSubview(mainView)
        mainView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        mainView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        mainView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        mainView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -130).isActive = true
        
        //stackView 추가
        mainView.addSubview(playStackView)
        playStackView.topAnchor.constraint(equalTo: mainView.topAnchor).isActive = true
        playStackView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor).isActive = true
        playStackView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor).isActive = true
        playStackView.bottomAnchor.constraint(equalTo: mainView.bottomAnchor).isActive = true
        
        //피자 이미지 추가
        playStackView.addArrangedSubview(pizzaImage)
        pizzaImage.widthAnchor.constraint(equalTo: mainView.widthAnchor).isActive = true
        pizzaImage.heightAnchor.constraint(equalToConstant: 250).isActive = true
        
        
        //메뉴 이름 추가
        playStackView.addArrangedSubview(menuNameLabel)
        menuNameLabel.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 15).isActive = true
        
        menuNameLabel.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        
        //메뉴 설명 추가
        playStackView.addArrangedSubview(menuInfoLabel)
        menuInfoLabel.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 15).isActive = true
        menuInfoLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        menuInfoLabel.widthAnchor.constraint(equalTo: mainView.widthAnchor).isActive = true
        
        //영양 성분 표시 보기 추가
        playStackView.addArrangedSubview(infoView)
        infoView.widthAnchor.constraint(equalTo: mainView.widthAnchor).isActive = true
        infoView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        infoView.addSubview(nutritionLabel)
        nutritionLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        nutritionLabel.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 20).isActive = true
        
        
        //바텀뷰 추가
        view.addSubview(bottomView)
        bottomView.topAnchor.constraint(equalTo: mainView.bottomAnchor
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
        button.backgroundColor = .yellow
        button.setTitleColor(.black, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var bottomView: UIView = {
        let view = UIView()
        view.backgroundColor = .yellow
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
    override func viewDidLoad() {
        super.viewDidLoad()
        print("changed")
        view.backgroundColor = .blue
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
        
    }
    
    @objc func didTapBackButton() {
        let mainViewController = ViewController()
        self.navigationController?.pushViewController(mainViewController, animated: true)
        
    }
}
