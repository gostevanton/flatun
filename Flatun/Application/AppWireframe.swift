//
//  AppWireframe.swift
//  Flatun
//
//  Created by Антон Гостев on 21.05.17.
//  Copyright © 2017 Антон Гостев. All rights reserved.
//

import UIKit

class AppWireframe: RootWireframeInterface {
    
    var window: UIWindow!
    
    static let menuViewController = ProviderWireframe.createViewController()
    
    func setMenuWireframe() {
        let providerWireframe = ProviderWireframe(root: self, view: AppWireframe.menuViewController as ProvidersViewInterface)
        providerWireframe.window = window
    }
    
    func showRoot(with viewController: UIViewController, in window: UIWindow) {
        let nav = UINavigationController(rootViewController: viewController)
        nav.setNavigationBarHidden(true, animated: false)
        window.rootViewController = nav
    }
    
    func showRoot(with viewController: UIViewController, in window: UIWindow, navBarHidden: Bool) {
        let nav = UINavigationController(rootViewController: viewController)
        nav.setNavigationBarHidden(navBarHidden, animated: false)

        UIView.transition(with: window, duration: 0.5, options: .transitionFlipFromRight, animations: {
            window.rootViewController = nav
        }, completion: nil)
    }
    
    func popViewController() {
        (window.rootViewController as! UINavigationController).popViewController(animated: true)
    }
    
    func presentVC(with viewController: UIViewController) {
        (window.rootViewController as! UINavigationController).pushViewController(viewController, animated: true)
    }
    
    func toggleMenu(with viewController: UIViewController) {
        AppWireframe.menuViewController.toggleMenu(viewController.navigationController!)
    }
    
    func closeMenu() {
        AppWireframe.menuViewController.closeMenu()
    }

}
