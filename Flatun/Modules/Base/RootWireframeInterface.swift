//
//  RootWireframeInterface.swift
//  Flatun
//
//  Created by Антон Гостев on 21.05.17.
//  Copyright © 2017 Антон Гостев. All rights reserved.
//

import UIKit

protocol RootWireframeInterface {
    
    func showRoot(with viewController: UIViewController, in window: UIWindow)
    
    func showRoot(with viewController: UIViewController, in window: UIWindow, navBarHidden: Bool)
    
    func popViewController()
    
    func presentVC(with viewController: UIViewController)
    
    func toggleMenu(with viewController: UIViewController)
    
    func closeMenu()

}
