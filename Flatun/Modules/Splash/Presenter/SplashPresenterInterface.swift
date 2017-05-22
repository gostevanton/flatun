//
//  SplashPresenterInterface.swift
//  Flatun
//
//  Created by Антон Гостев on 21.05.17.
//  Copyright © 2017 Антон Гостев. All rights reserved.
//

import Foundation

protocol SplashPresenterInterface: class {
    
    var view: SplashViewInterface! { set get }
    var interactor: SplashInteractorInterface! { set get }
    var wireframe: SplashWireframeInterface! { set get }
    
    func initData()
    
    func presentPostView()
    
    func showError()
}
