//
//  Compass.swift
//  GlobalPrayerTimes
//
//  Created by muhammad on 9/7/19
//  Copyright © 2019 muhammad. All rights reserved.
//

import UIKit
import CoreLocation

class QiblaVC: UIViewController, CLLocationManagerDelegate {
    
    //Outlets
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var cityName: UILabel!
    @IBOutlet weak var angleLabel: UILabel!
    
    
//    let locationDelegate = LocationDelegate()
//    var latestLocation: CLLocation? = nil
//    var yourLocationBearing: CGFloat { return latestLocation?.bearingToLocationRadian(self.yourLocation) ?? 0 }
//    var yourLocation: CLLocation {
//        get { return UserDefaults.standard.currentLocation }
//        set { UserDefaults.standard.currentLocation = newValue }
//    }
//
//    let locationManager: CLLocationManager = {
//        $0.requestWhenInUseAuthorization()
//        $0.desiredAccuracy = kCLLocationAccuracyBest
//        $0.startUpdatingLocation()
//        $0.startUpdatingHeading()
//        return $0
//    }(CLLocationManager())
//
//    private func orientationAdjustment() -> CGFloat {
//        let isFaceDown: Bool = {
//            switch UIDevice.current.orientation {
//            case .faceDown: return true
//            default: return false
//            }
//        }()
//
//        let adjAngle: CGFloat = {
//            switch UIApplication.shared.statusBarOrientation {
//            case .landscapeLeft:  return 90
//            case .landscapeRight: return -90
//            case .portrait, .unknown: return 0
//            case .portraitUpsideDown: return isFaceDown ? 180 : -180
//            @unknown default:
//                fatalError()
//            }
//        }()
//        return adjAngle
//    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        cityName.text = CHOOSEN_CITY
//        locationManager.delegate = locationDelegate
//
//        locationDelegate.locationCallback = { location in
//            self.latestLocation = location
//        }
//
//        locationDelegate.headingCallback = { newHeading in
//
//            func computeNewAngle(with newAngle: CGFloat) -> CGFloat {
//                let heading: CGFloat = {
//                    let originalHeading = self.yourLocationBearing - newAngle.degreesToRadians
//                    switch UIDevice.current.orientation {
//                    case .faceDown: return -originalHeading
//                    default: return originalHeading
//                    }
//                }()
//
//                return CGFloat(self.orientationAdjustment().degreesToRadians + heading)
//            }
//
//            UIView.animate(withDuration: 0.5) {
//                let angle = computeNewAngle(with: CGFloat(newHeading))
//                self.imageView.transform = CGAffineTransform(rotationAngle: angle)
//
//            }
//        }
//    }
//}

let locationDelegate = LocationDelegate()
var latestLocation: CLLocation? = nil
var yourLocationBearing: CGFloat { return latestLocation?.bearingToLocationRadian(self.yourLocation) ?? 0 }
var yourLocation: CLLocation {
    get { return UserDefaults.standard.currentLocation }
    set { UserDefaults.standard.currentLocation = newValue }
}

let locationManager: CLLocationManager = {
    $0.requestWhenInUseAuthorization()
    $0.desiredAccuracy = kCLLocationAccuracyBest
    $0.startUpdatingLocation()
    $0.startUpdatingHeading()
    return $0
}(CLLocationManager())


override func viewDidLoad() {
    
    super.viewDidLoad()
    cityName.text = CHOOSEN_CITY
    locationManager.delegate = locationDelegate
    let locationManager = CLLocationManager()
    locationManager.delegate = self
    locationManager.requestAlwaysAuthorization()
    
    
    var qiblaAngle : CGFloat = 0.0
    
    locationDelegate.errorCallback = { error in
        self.angleLabel.text = error
        self.imageView.isHidden = true
        print(error)
    }
    
    locationDelegate.locationCallback = { location in
        self.latestLocation = location
        
        let phiK = 21.4*CGFloat.pi/180.0
        let lambdaK = 39.8*CGFloat.pi/180.0
        let phi = CGFloat(location.coordinate.latitude) * CGFloat.pi/180.0
        let lambda =  CGFloat(location.coordinate.longitude) * CGFloat.pi/180.0
        qiblaAngle = 180.0/CGFloat.pi * atan2(sin(lambdaK-lambda),cos(phi)*tan(phiK)-sin(phi)*cos(lambdaK-lambda))
        self.angleLabel.text = "\(Int(qiblaAngle.rounded()))°"
        self.imageView.isHidden = false
    }
    
    locationDelegate.headingCallback = { newHeading in
        
        func computeNewAngle(with newAngle: CGFloat) -> CGFloat {
            let heading = self.yourLocationBearing - newAngle.degreesToRadians
            return CGFloat(heading)
        }
        
        UIView.animate(withDuration: 0.5) {
            let angle = (CGFloat.pi/180 * -(CGFloat(newHeading) - qiblaAngle))
            self.imageView.transform = CGAffineTransform(rotationAngle: angle)
        }
    }
    
}

}
