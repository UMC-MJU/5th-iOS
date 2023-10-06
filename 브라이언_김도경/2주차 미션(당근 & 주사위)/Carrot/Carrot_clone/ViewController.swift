//
//  ViewController.swift
//  Carrot_clone
//
//  Created by 김도경 on 10/6/23.
//

import UIKit

class ViewController: UIViewController {
    
    let testArr = generateRandomData()
    
    //TopBar
    @IBOutlet weak var topBar: UIView!
    
    @IBOutlet weak var location: UILabel!
    
    @IBOutlet weak var search: UIButton!
    @IBOutlet weak var list: UIButton!
    @IBOutlet weak var bell: UIButton!
    
    //CollectionView
    let collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width - 20, height: 150)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return collectionView
    }()
    
    //TabBar
    @IBOutlet weak var tabBar: UITabBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //location
        location.text = "광명동 ⋁"
        location.font = UIFont.boldSystemFont(ofSize: 20)
        
        //bell
        bell.tintColor = .black
        //list
        list.tintColor = .black
        
        //search
        search.tintColor = .black
        
        //CollectionView
        attribute()
        layout()
        
        //TabBar
        tabBar.backgroundColor = .white
        tabBar.tintColor = .black
        
    }
}

//For ScrollViews

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return testArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //Horizontal View
        if indexPath.row == 1 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Horizon", for: indexPath) as? HorizontalCollectionViewCell else { return UICollectionViewCell() }
            return cell
            
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellId", for: indexPath) as? CustomCollectionViewCell else { return UICollectionViewCell() }
            
            cell.pic.image = UIImage(named: testArr[indexPath.row].imageName)
            cell.locText.text = testArr[indexPath.row].location
            cell.title.text = testArr[indexPath.row].title
            cell.price.text = toWon(num: testArr[indexPath.row].price)
            
            //예약중 상태 설정
            cell.isReserved = testArr[indexPath.row].isReserved
            
            return cell
        }
    }
    
    //Set basic layout
    func layout(){
        view.addSubview(collectionView)
        
        //AutoLayout
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: topBar.bottomAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: tabBar.topAnchor).isActive = true
    }
    
    func attribute(){
        collectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: CustomCollectionViewCell.cellId)
        collectionView.register(HorizontalCollectionViewCell.self, forCellWithReuseIdentifier: HorizontalCollectionViewCell.cellId)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func toWon(num : Int) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal

        guard let result = numberFormatter.string(from: NSNumber(value: num)) else { return ""}
        
        return result + "원"
    }
}
