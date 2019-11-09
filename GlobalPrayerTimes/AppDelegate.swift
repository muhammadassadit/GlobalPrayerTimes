//
//  AppDelegate.swift
//  GlobalPrayerTimes
//
//  Created by muhammad on 9/7/19
//  Copyright © 2019 muhammad. All rights reserved.
//

import UIKit
import Firebase
import CoreLocation

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions
        launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        RunLoop.current.run(until: Date(timeIntervalSinceNow: 5.0))
        FirebaseApp.configure()
        return true
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        
    }
    
}
