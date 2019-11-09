//
//  DisplayVC.swift
//  GlobalPrayerTimes
//
//  Created by muhammad on 9/7/19
//  Copyright © 2019 muhammad. All rights reserved.
//

import UIKit



class DisplayVC: UIViewController {
    
    //Outlets
    @IBOutlet weak var displayChoosenDateLbl: UILabel!
    @IBOutlet weak var displayChoosenCountryAndCityLbl: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.displayTheFinalData()
    }
    
    
    func displayTheFinalData(){
        
        self.displayChoosenDateLbl.text = CHOOSEN_DATE
        self.displayChoosenCountryAndCityLbl.text = "\(CHOOSEN_CITY!)"
        
    }
}
