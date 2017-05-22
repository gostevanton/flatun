//
//  SplashViewInterface.swift
//  Flatun
//
//  Created by Антон Гостев on 21.05.17.
//  Copyright © 2017 Антон Гостев. All rights reserved.
//

import UIKit

protocol SplashViewInterface: class {
    
    var controller: UIViewController? { get }
    var presenter: SplashPresenterInterface! { set get }
    
    func setRefreshHidden(_ hidden: Bool)
    
}
