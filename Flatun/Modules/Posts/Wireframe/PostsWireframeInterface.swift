//
//  PostWireframeInterface.swift
//  Flatun
//
//  Created by Антон Гостев on 21.05.17.
//  Copyright © 2017 Антон Гостев. All rights reserved.
//

import UIKit

protocol PostsWireframeInterface: class {
    
    var root: RootWireframeInterface? { set get }

    init(root: RootWireframeInterface?, view: PostsViewInterface)

    func attachRoot(with controller: UIViewController, in window: UIWindow)
    
    func presentVC(with controller: UIViewController)
    
    func popViewController()
    
    func toggleMenu()
    
    func presentSubPosts(for provider: Provider?, with author: String)
}
