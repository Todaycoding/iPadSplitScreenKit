//
//  AppDelegate.swift
//  iPadSplitScreenDemo
//
//  Created by admin on 9/10/2020.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow.init()
        window?.rootViewController = ViewController()
        window?.makeKeyAndVisible()
        return true
    }
}

