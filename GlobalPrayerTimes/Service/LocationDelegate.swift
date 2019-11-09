//
//  LocationDelegate.swift
//  GlobalPrayerTimes
//
//  Created by muhammad on 9/7/19
//  Copyright © 2019 muhammad. All rights reserved.
//

import Foundation
import CoreLocation

class LocationDelegate: NSObject, CLLocationManagerDelegate {
    var locationCallback: ((CLLocation) -> ())? = nil
    var headingCallback: ((CLLocationDirection) -> ())? = nil
    var errorCallback: ((String) -> ())? = nil
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let currentLocation = locations.last else { return }
        locationCallback?(currentLocation)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
        headingCallback?(newHeading.trueHeading)
    }
    
//    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
//        print("⚠️ Error while updating location " + error.localizedDescription)
//        errorCallback?("⚠️ Please enable Location!")
//    }
}
