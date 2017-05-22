//
//  ProvidersViewInterface.swift
//  Flatun
//
//  Created by Антон Гостев on 21.05.17.
//  Copyright © 2017 Антон Гостев. All rights reserved.
//

import UIKit

protocol ProvidersViewInterface: class {
    
    var controller: UIViewController? { get }
    var presenter: ProvidersPresenterInterface! { set get }
    
    func showProviders(_ providers: [Provider])
    
}
