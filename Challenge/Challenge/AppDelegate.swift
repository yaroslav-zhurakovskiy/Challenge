//
//  AppDelegate.swift
//  Challenge
//
//  Created by Yaroslav Zhurakovskiy on 1/30/17.
//  Copyright © 2017 Yaroslav Zhurakovskiy. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        let controller = ListController(nibName: nil, bundle: nil);
        let router: ListRouter = NoListRouter()
        controller.presenter = ListPresenter(view: controller, service: FakePlaceService(), router: router)
        
        self.window?.rootViewController = controller
        self.window?.makeKeyAndVisible()
        
        return true
    }
}

