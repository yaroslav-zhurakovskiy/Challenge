//
//  AppDelegate.swift
//  Challenge
//
//  Created by Yaroslav Zhurakovskiy on 1/30/17.
//  Copyright © 2017 Yaroslav Zhurakovskiy. All rights reserved.
//

import UIKit
import PainlessInjection


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        Container.load()
        
        let controller: ListController = Container.get()
        self.window?.rootViewController = UINavigationController(rootViewController: controller)
        self.window?.makeKeyAndVisible()
        
        return true
    }
}

