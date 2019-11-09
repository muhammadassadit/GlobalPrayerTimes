//
//  WebViewController.swift
//  GlobalPrayerTimes
//
//  Created by muhammad on 9/12/19.
//  Copyright © 2019 muhammad. All rights reserved.
//

import UIKit
import SafariServices

class SafariViewController: UIViewController {
    
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
    
    @IBAction func learnMoreTapped() {
    
    guard let url = URL(string: "https://www.youtube.com/watch?v=T16hrEwmXTk") else { return }
    let site = SFSafariViewController(url: url)
    present(site, animated: true)
    
    }
    
    @IBAction func readMoreTapped() {
        guard let twourl = URL(string: "https://www.wikihow.com/Pray-in-Islam") else { return }
        let site = SFSafariViewController(url: twourl)
        present(site, animated: true)
        
    }
    
}
