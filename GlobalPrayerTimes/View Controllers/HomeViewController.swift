//
//  HomeViewController.swift
//  GlobalPrayerTimes
//
//  Created by muhammad on 9/10/19
//  Copyright © 2019 muhammad. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    var gradient:CAGradientLayer?

    override func viewDidLoad() {
        super.viewDidLoad()
    addGradient()
        
    }
    
    func addGradient() {
        gradient = CAGradientLayer()
        let startColor = UIColor(red: 3/255, green: 196/255, blue: 190/255, alpha: 1)
        let endColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        gradient?.colors = [startColor.cgColor,endColor.cgColor]
        gradient?.startPoint = CGPoint(x: 0, y: 0)
        gradient?.endPoint = CGPoint(x: 0, y:1)
        gradient?.frame = view.frame
        self.view.layer.insertSublayer(gradient!, at: 0)
    }

}
