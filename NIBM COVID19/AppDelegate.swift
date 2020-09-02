//
//  AppDelegate.swift
//  NIBM COVID19
//
//  Created by chamod Nimsara on 8/29/20.
//  Copyright © 2020 NIBM. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow()
        window?.makeKeyAndVisible()
        window?.rootViewController = UINavigationController(rootViewController: LoginViewController())
//        FirebaseApp.configure()

        
        return true
    }

    // MARK: UISceneSession Lifecycle

}