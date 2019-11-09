//
//  CountriesCells.swift
//  GlobalPrayerTimes
//
//  Created by muhammad on 9/7/19
//  Copyright © 2019 muhammad. All rights reserved.
//

import UIKit

class CountriesCells: UITableViewCell {
    
    // The view manages input (key presses, mouse movements, touch gestures, etc.) which ultimately manipulates properties of the model.
    
    @IBOutlet weak var countriesCellsLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
}
