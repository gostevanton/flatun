//
//  ProviderWireframe.swift
//  Flatun
//
//  Created by Антон Гостев on 21.05.17.
//  Copyright © 2017 Антон Гостев. All rights reserved.
//

import UIKit

class ProviderWireframe: ProvidersWireframeInterface {
    
    var root: RootWireframeInterface?
    var window: UIWindow!
    
    required init(root: RootWireframeInterface?, view: ProvidersViewInterface) {
        self.root = root
        
        let interactor = ProvidersInteractor()
        let presenter = ProvidersPresenter()
        
        view.presenter = presenter
        interactor.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.wireframe = self
    }
    
    func presentPostsFor(_ provider: Provider?) {
        
        let vc = PostsWireframe.createViewController()
        let postsWireframe = PostsWireframe(root: root, view: vc as PostsViewInterface)
        
        root?.closeMenu()
        
        postsWireframe.presenter.provider = provider
        postsWireframe.attachRoot(with: vc, in: window!)
    }
    
    static func createViewController() -> ProvidersViewController {
        let sb = UIStoryboard(name: "Providers", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "ProvidersViewController")

        return vc as! ProvidersViewController
    }
}
