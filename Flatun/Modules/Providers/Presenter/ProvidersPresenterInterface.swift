//
//  ProvidersPresenterInterface.swift
//  Flatun
//
//  Created by Антон Гостев on 21.05.17.
//  Copyright © 2017 Антон Гостев. All rights reserved.
//

import Foundation

protocol ProvidersPresenterInterface: class {
    
    var view: ProvidersViewInterface! { set get }
    var interactor: ProvidersInteractorInterface! { set get }
    var wireframe: ProvidersWireframeInterface! { set get }
    
    func getProviders()
    
    func showProviders(_ providers: [Provider])
    
    func showPostsFor(provider: Provider?)
    
}
