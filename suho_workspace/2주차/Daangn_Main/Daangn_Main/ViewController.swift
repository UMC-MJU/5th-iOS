//
//  ViewController.swift
//  Daangn_Main
//
//  Created by 배수호 on 10/6/23.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

        // UIView 생성 및 설정
        let navigationView = UIView()
        navigationView.backgroundColor = .white
        navigationView.translatesAutoresizingMaskIntoConstraints = false

        // UILabel 생성 및 설정
        let titleLabel = UILabel()
        titleLabel.text = "광명동 v"
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = UIFont.boldSystemFont(ofSize: 20)

        // UIView를 뷰 컨트롤러의 뷰에 추가
        view.addSubview(navigationView)

        // UILabel을 navigationView에 추가하고 위치 제약 설정
        navigationView.addSubview(titleLabel)
        titleLabel.leadingAnchor.constraint(equalTo: navigationView.leadingAnchor, constant: 20).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: navigationView.bottomAnchor, constant: -15).isActive = true

        // UIView의 크기와 위치 제약 설정 (높이는 100으로 고정, 너비는 match_parent와 유사한 동작)
        navigationView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        navigationView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        navigationView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        navigationView.heightAnchor.constraint(equalToConstant: 100).isActive = true

        // 이미지 뷰 3개 생성 및 설정
        let imageView1 = UIImageView()
        imageView1.image = UIImage(named: "ic_bell")
        let imageView2 = UIImageView()
        imageView2.image = UIImage(named: "ic_search")
        let imageView3 = UIImageView()
        imageView3.image = UIImage(named: "ic_menu")
        
        // 이미지 뷰를 navigationView에 추가하고 위치 및 크기 제약 설정
        navigationView.addSubview(imageView1)
        navigationView.addSubview(imageView2)
        navigationView.addSubview(imageView3)
        
        imageView1.translatesAutoresizingMaskIntoConstraints = false
        imageView2.translatesAutoresizingMaskIntoConstraints = false
        imageView3.translatesAutoresizingMaskIntoConstraints = false
        
        imageView1.widthAnchor.constraint(equalToConstant: 20).isActive = true
        imageView1.heightAnchor.constraint(equalToConstant: 20).isActive = true
        imageView1.trailingAnchor.constraint(equalTo: navigationView.trailingAnchor, constant: -20).isActive = true
        imageView1.bottomAnchor.constraint(equalTo: navigationView.bottomAnchor, constant: -20).isActive = true
        
        imageView2.widthAnchor.constraint(equalToConstant: 30).isActive = true
        imageView2.heightAnchor.constraint(equalToConstant: 30).isActive = true
        imageView2.trailingAnchor.constraint(equalTo: imageView1.leadingAnchor, constant: -20).isActive = true
        imageView2.bottomAnchor.constraint(equalTo: navigationView.bottomAnchor, constant: -15).isActive = true
        
        
        imageView3.widthAnchor.constraint(equalToConstant: 30).isActive = true
        imageView3.heightAnchor.constraint(equalToConstant: 30).isActive = true
        imageView3.trailingAnchor.constraint(equalTo: imageView2.leadingAnchor, constant: -20).isActive = true
        imageView3.bottomAnchor.constraint(equalTo: navigationView.bottomAnchor, constant: -15).isActive = true
        
        
        
        let tableView = UITableView()
        
        tableView.delegate = self
        tableView.dataSource = self
        let feedNIb = UINib(nibName: "FeedTableViewCell", bundle: nil)
        tableView.register(feedNIb, forCellReuseIdentifier:"FeedTableViewCell")
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        // UITableView 제약 설정
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
            tableView.topAnchor.constraint(equalTo: navigationView.bottomAnchor).isActive = true
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        let StoryNib = UINib(nibName: "StoryTableViewCell", bundle: nil)
        tableView.register(StoryNib, forCellReuseIdentifier: "StoryTableViewCell")
        
        let bottomBar = UIView()
        bottomBar.backgroundColor = .white
        bottomBar.translatesAutoresizingMaskIntoConstraints = false

        // UIView를 뷰 컨트롤러의 뷰에 추가
        view.addSubview(bottomBar)
        bottomBar.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        bottomBar.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        bottomBar.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        bottomBar.heightAnchor.constraint(equalToConstant: 70).isActive = true
        
        let btmimageView1 = UIImageView()
        btmimageView1.image = UIImage(named: "ic_user")
        let btmimageView2 = UIImageView()
        btmimageView2.image = UIImage(named: "ic_chat")
        let btmimageView3 = UIImageView()
        btmimageView3.image = UIImage(named: "ic_location")
        let btmimageView4 = UIImageView()
        btmimageView4.image = UIImage(named: "ic_list")
        let btmimageView5 = UIImageView()
        btmimageView5.image = UIImage(named: "ic_home")
        
        bottomBar.addSubview(btmimageView1)
        bottomBar.addSubview(btmimageView2)
        bottomBar.addSubview(btmimageView3)  
        bottomBar.addSubview(btmimageView4)
        bottomBar.addSubview(btmimageView5)
        
        btmimageView1.translatesAutoresizingMaskIntoConstraints = false
        btmimageView2.translatesAutoresizingMaskIntoConstraints = false
        btmimageView3.translatesAutoresizingMaskIntoConstraints = false
        btmimageView4.translatesAutoresizingMaskIntoConstraints = false
        btmimageView5.translatesAutoresizingMaskIntoConstraints = false
        // 첫 번째 이미지뷰 제약 설정
        btmimageView1.translatesAutoresizingMaskIntoConstraints = false
        btmimageView1.widthAnchor.constraint(equalToConstant: 30).isActive = true
        btmimageView1.heightAnchor.constraint(equalToConstant: 30).isActive = true
        btmimageView1.leadingAnchor.constraint(equalTo: bottomBar.centerXAnchor, constant: 130).isActive = true
        btmimageView1.centerYAnchor.constraint(equalTo: bottomBar.centerYAnchor).isActive = true

        // 두 번째 이미지뷰 제약 설정
        btmimageView2.translatesAutoresizingMaskIntoConstraints = false
        btmimageView2.widthAnchor.constraint(equalToConstant: 30).isActive = true
        btmimageView2.heightAnchor.constraint(equalToConstant: 30).isActive = true
        btmimageView2.leadingAnchor.constraint(equalTo: bottomBar.centerXAnchor, constant: 50).isActive = true
        btmimageView2.centerYAnchor.constraint(equalTo: bottomBar.centerYAnchor).isActive = true

        // 세 번째 이미지뷰 제약 설정
        btmimageView3.translatesAutoresizingMaskIntoConstraints = false
        btmimageView3.widthAnchor.constraint(equalToConstant: 30).isActive = true
        btmimageView3.heightAnchor.constraint(equalToConstant: 30).isActive = true
        btmimageView3.leadingAnchor.constraint(equalTo: bottomBar.centerXAnchor,constant: -30).isActive = true
        btmimageView3.centerYAnchor.constraint(equalTo: bottomBar.centerYAnchor).isActive = true

        // 네 번째 이미지뷰 제약 설정
        btmimageView4.translatesAutoresizingMaskIntoConstraints = false
        btmimageView4.widthAnchor.constraint(equalToConstant: 30).isActive = true
        btmimageView4.heightAnchor.constraint(equalToConstant: 30).isActive = true
        btmimageView4.leadingAnchor.constraint(equalTo: bottomBar.centerXAnchor, constant: -100).isActive = true
        btmimageView4.centerYAnchor.constraint(equalTo: bottomBar.centerYAnchor).isActive = true

        // 다섯 번째 이미지뷰 제약 설정
        btmimageView5.translatesAutoresizingMaskIntoConstraints = false
        btmimageView5.widthAnchor.constraint(equalToConstant: 30).isActive = true
        btmimageView5.heightAnchor.constraint(equalToConstant: 30).isActive = true
        btmimageView5.leadingAnchor.constraint(equalTo: btmimageView4.trailingAnchor, constant: 10).isActive = true
        btmimageView5.trailingAnchor.constraint(equalTo: bottomBar.centerXAnchor, constant: -150).isActive = true
        btmimageView5.centerYAnchor.constraint(equalTo: bottomBar.centerYAnchor).isActive = true

    }
    


        
}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 5 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "StoryTableViewCell", for: indexPath) as? StoryTableViewCell
            else{
                return UITableViewCell()
            }
            return cell
        }
        else{
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "FeedTableViewCell", for: indexPath) as? FeedTableViewCell else{
                return UITableViewCell()
            }
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int ) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 5{
            return 336
        }else{
            return 150 // 원하는 셀 높이로 설정
        }
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let tableViewCell = cell as? StoryTableViewCell else{
            return
        }
        tableViewCell.setCollectionViewDataSourceDelegate(dataSourceDelegate: self, forRow: indexPath.row)
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StoryCollectionViewCell", for: indexPath) as? StoryCollectionViewCell else{
            return UICollectionViewCell()
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width:150 , height: 230)
    }
    
}
