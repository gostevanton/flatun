//
//  ProvidersInteractorInterface.swift
//  Flatun
//
//  Created by Антон Гостев on 21.05.17.
//  Copyright © 2017 Антон Гостев. All rights reserved.
//

import Foundation

protocol ProvidersInteractorInterface: class {
    
    var dataMager: DataManager! { set get }
    var presenter: ProvidersPresenterInterface! { set get }
    
    init()
    
    func getProviders()
}
