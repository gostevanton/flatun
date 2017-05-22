//
//  ProvidersWireframeInterface.swift
//  Flatun
//
//  Created by Антон Гостев on 21.05.17.
//  Copyright © 2017 Антон Гостев. All rights reserved.
//

import Foundation

protocol ProvidersWireframeInterface: class {
    
    var root: RootWireframeInterface? { set get }

    init(root: RootWireframeInterface?, view: ProvidersViewInterface)
    
    func presentPostsFor(_ provider: Provider?)
}
