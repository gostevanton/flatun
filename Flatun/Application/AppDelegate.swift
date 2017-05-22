//
//  AppDelegate.swift
//  Flatun
//
//  Created by Антон Гостев on 21.05.17.
//  Copyright © 2017 Антон Гостев. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        let dependency = AppDependency()
        dependency.appWireframe.window = window!
        dependency.appWireframe.setMenuWireframe()
        dependency.attachRootViewControllerInWindow(window)
        
        return true
    }

}

