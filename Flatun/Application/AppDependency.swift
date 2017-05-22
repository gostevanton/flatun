//
//  AppDependency.swift
//  Flatun
//
//  Created by Антон Гостев on 21.05.17.
//  Copyright © 2017 Антон Гостев. All rights reserved.
//

import UIKit

class AppDependency: AnyObject {
    
    var appWireframe: AppWireframe!
    
    init() {
        self.appWireframe = AppWireframe()
    }
    
    func attachRootViewControllerInWindow(_ window: UIWindow!) {

        let vc = SplashWireframe.createViewController()
        let splashWireframe = SplashWireframe(root: appWireframe, view: vc)
        splashWireframe.window = window
        splashWireframe.attachRoot(with: vc, in: window)
        
    }

}
