//
//  SplashWireframeInterface.swift
//  Flatun
//
//  Created by Антон Гостев on 21.05.17.
//  Copyright © 2017 Антон Гостев. All rights reserved.
//

import UIKit

protocol SplashWireframeInterface: class {
    
    var root: RootWireframeInterface? { set get }
    
    var window: UIWindow! { set get }

    init(root: RootWireframeInterface?, view: SplashViewController)

    func attachRoot(with controller: UIViewController, in window: UIWindow)

    func presentPostView()
    
    func showErrorAlert(title: String, message: String, from controller: UIViewController?)
}
