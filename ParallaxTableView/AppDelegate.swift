//
//  AppDelegate.swift
//  ParallaxTableView
//
//  Created by Александр Алгашев on 08.08.2020.
//  Copyright © 2020 Александр Алгашев. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let tableViewController = TableViewController()
        let navigationController = UINavigationController(rootViewController: tableViewController)
        self.window = UIWindow(rootViewController: navigationController)
        
        return true
    }

}

