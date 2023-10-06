//
//  HorizontalCollectionViewCell.swift
//  Carrot_clone
//
//  Created by 김도경 on 10/6/23.
//

import UIKit

class HorizontalCollectionViewCell: UICollectionViewCell {
    
    static let cellId = "Horizon"
    
    let arr = [1,2,3,4,5,12,35,2315]
    
    let label = {
        let label = UILabel()
        label.text = "시원한 여름 간식의 계절 🍦🍨🍧"
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    let collectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 100, height: 130)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return collectionView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
        setConst()
        collectionView.register(CustomHoriontalCell.self, forCellWithReuseIdentifier: CustomHoriontalCell.cellId)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.reloadData()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addViews(){
        self.addSubview(label)
        self.addSubview(collectionView)
    }
    
    private func setConst(){
        label.translatesAutoresizingMaskIntoConstraints = false
        label.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15).isActive = true
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 5).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15).isActive = true
    }
    
}

extension HorizontalCollectionViewCell : UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HorizonCell", for: indexPath) as? CustomHoriontalCell else { return UICollectionViewCell() }
        print("Horizon Custom cell")
        cell.pic.image = UIImage(named: "AirpodMax")
        cell.title.text = "싸다싸다 엄청 싸다~"
        cell.price.text = toWon(num: 100000)
        
        return cell
    }
    
    
    func toWon(num : Int) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal

        guard let result = numberFormatter.string(from: NSNumber(value: num)) else { return ""}
        
        return result + "원"
    }
    
}
