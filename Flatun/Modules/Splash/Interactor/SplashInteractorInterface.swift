//
//  ProvidersInteractorInterface.swift
//  Flatun
//
//  Created by Антон Гостев on 21.05.17.
//  Copyright © 2017 Антон Гостев. All rights reserved.
//

import Foundation

protocol SplashInteractorInterface: class {
    
    var dataMager: DataManager! { set get }
    var presenter: SplashPresenterInterface! { set get }
    
    init()
    
    func initProviders()
    
}
