//
//  ViewController.swift
//  UmcProject
//
//  Created by 최윤아 on 2023/09/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var UIbar: UIView!
    
    @IBOutlet weak var MyHome: UIButton!
    
    @IBOutlet weak var SB: UISearchBar!
    
    @IBOutlet weak var coupon: UIView!
    
    @IBOutlet weak var delivery1: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIbar.layer.cornerRadius = 20 
        UIbar.layer.masksToBounds = true
        
        MyHome.setTitle("우리집", for: .normal)
        MyHome.setTitleColor(.white, for: .normal)
        
        MyHome.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        
        SB.layer.borderWidth = 0
        SB.layer.borderColor = UIColor.clear.cgColor //테두리 색상을 투명으로 설정하여 제거
        SB.layer.cornerRadius = 0
        SB.backgroundColor = UIColor.white
        coupon.layer.borderWidth = 1.0
        coupon.layer.borderColor =  UIColor.purple.cgColor
        coupon.layer.cornerRadius = 10
        
        
        
        
        
        
        
    }
    
    
    
    
}
